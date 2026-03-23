#!/usr/bin/env bash
# Vale sonuçlarını GitHub Actions Step Summary ve Annotations olarak raporlar.
# Kullanım: vale-report.sh <vale-config> <files> [min_alert_level]
#
# Çıktılar:
#   - $GITHUB_STEP_SUMMARY: Markdown tablo + hata/uyarı sayaçları
#   - stdout: GitHub Annotations (::error, ::warning, ::notice)
#   - exit code: Vale'in çıkış kodu (0=temiz, 1=hata var, 2=config hatası)

set -euo pipefail

VALE_CONFIG="${1:?Kullanım: vale-report.sh <config> <files>}"
FILES="${2:-.}"
MIN_LEVEL="${3:-suggestion}"

# Vale'i JSON formatında çalıştır
VALE_JSON=$(mktemp /tmp/vale-results.XXXXXX.json)
VALE_EXIT=0
vale --config="$VALE_CONFIG" --output=JSON --minAlertLevel="$MIN_LEVEL" "$FILES" > "$VALE_JSON" 2>&1 || VALE_EXIT=$?

# JSON boş veya geçersizse
if [ ! -s "$VALE_JSON" ] || ! jq empty "$VALE_JSON" 2>/dev/null; then
  if [ -n "${GITHUB_STEP_SUMMARY:-}" ]; then
    echo "## Vale Turkish Sonuçları" >> "$GITHUB_STEP_SUMMARY"
    echo "" >> "$GITHUB_STEP_SUMMARY"
    if [ "$VALE_EXIT" -eq 0 ]; then
      echo "Hiçbir sorun bulunamadı." >> "$GITHUB_STEP_SUMMARY"
    else
      echo "Vale çalıştırılamadı (exit code: $VALE_EXIT)." >> "$GITHUB_STEP_SUMMARY"
    fi
  fi
  rm -f "$VALE_JSON"
  exit "$VALE_EXIT"
fi

# Sayaçları hesapla
ERRORS=$(jq '[.[] | .[] | select(.Severity == "error")] | length' "$VALE_JSON")
WARNINGS=$(jq '[.[] | .[] | select(.Severity == "warning")] | length' "$VALE_JSON")
SUGGESTIONS=$(jq '[.[] | .[] | select(.Severity == "suggestion")] | length' "$VALE_JSON")
TOTAL=$((ERRORS + WARNINGS + SUGGESTIONS))
FILE_COUNT=$(jq 'keys | length' "$VALE_JSON")

# --- GitHub Annotations ---
jq -r '
  to_entries[] |
  .key as $file |
  .value[] |
  if .Severity == "error" then
    "::error file=\($file),line=\(.Line),col=\(.Span[0])::\(.Message)"
  elif .Severity == "warning" then
    "::warning file=\($file),line=\(.Line),col=\(.Span[0])::\(.Message)"
  else
    "::notice file=\($file),line=\(.Line),col=\(.Span[0])::\(.Message)"
  end
' "$VALE_JSON"

# --- GitHub Step Summary ---
if [ -n "${GITHUB_STEP_SUMMARY:-}" ]; then
  {
    echo "## Vale Turkish Sonuçları"
    echo ""

    # Durum badge'leri
    if [ "$ERRORS" -eq 0 ] && [ "$WARNINGS" -eq 0 ]; then
      echo "**Tebrikler!** Hiçbir sorun bulunamadı."
    else
      if [ "$ERRORS" -gt 0 ]; then
        echo "| Hata | Uyarı | Öneri | Dosya |"
        echo "|:----:|:-----:|:-----:|:-----:|"
        echo "| $ERRORS | $WARNINGS | $SUGGESTIONS | $FILE_COUNT |"
      else
        echo "| Uyarı | Öneri | Dosya |"
        echo "|:-----:|:-----:|:-----:|"
        echo "| $WARNINGS | $SUGGESTIONS | $FILE_COUNT |"
      fi
    fi

    # Detaylı tablo (collapsible)
    if [ "$TOTAL" -gt 0 ]; then
      echo ""
      echo "<details>"
      echo "<summary>Detaylı sonuçlar ($TOTAL bulgu)</summary>"
      echo ""
      echo "| Dosya | Satır | Seviye | Mesaj |"
      echo "|-------|:-----:|:------:|-------|"

      jq -r '
        to_entries[] |
        .key as $file |
        .value[] |
        "| `\($file)` | \(.Line) | \(
          if .Severity == "error" then "hata"
          elif .Severity == "warning" then "uyarı"
          else "öneri"
          end
        ) | \(.Message) |"
      ' "$VALE_JSON"

      echo ""
      echo "</details>"
    fi
  } >> "$GITHUB_STEP_SUMMARY"
fi

rm -f "$VALE_JSON"
exit "$VALE_EXIT"
