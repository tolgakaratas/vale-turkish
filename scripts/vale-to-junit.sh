#!/usr/bin/env bash
# Vale JSON çıktısını JUnit XML formatına çevirir (GitLab CI artifacts:reports:junit için).
# Kullanım: vale --output=JSON . | vale-to-junit.sh > junit.xml

set -euo pipefail

INPUT="${1:-/dev/stdin}"

cat <<'HEADER'
<?xml version="1.0" encoding="UTF-8"?>
HEADER

# jq ile JUnit XML oluştur
jq -r '
  # Toplam hata sayısı
  [.[] | .[] | select(.Severity == "error")] | length as $failures |
  [.[] | .[]] | length as $tests |

  # Dosya bazlı test case'ler
  "<testsuite name=\"Vale Turkish\" tests=\"\($tests)\" failures=\"\($failures)\">\n" +
  (
    [
      to_entries[] |
      .key as $file |
      .value[] |
      if .Severity == "error" then
        "  <testcase name=\"\($file):\(.Line)\" classname=\"\(.Check)\">\n    <failure message=\"\(.Message | gsub("&";"&amp;") | gsub("\"";"&quot;") | gsub("<";"&lt;") | gsub(">";"&gt;"))\" type=\"\(.Severity)\"/>\n  </testcase>"
      else
        "  <testcase name=\"\($file):\(.Line)\" classname=\"\(.Check)\"/>"
      end
    ] | join("\n")
  ) +
  "\n</testsuite>"
' "$INPUT"
