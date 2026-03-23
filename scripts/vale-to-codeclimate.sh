#!/usr/bin/env bash
# Vale JSON çıktısını CodeClimate JSON formatına çevirir (GitLab CI artifacts:reports:codequality için).
# Kullanım: vale --output=JSON . | vale-to-codeclimate.sh > gl-code-quality-report.json

set -euo pipefail

INPUT="${1:-/dev/stdin}"

jq '
  [
    to_entries[] |
    .key as $file |
    .value[] |
    {
      description: .Message,
      check_name: .Check,
      fingerprint: ($file + ":" + (.Line|tostring) + ":" + .Check),
      severity: (
        if .Severity == "error" then "major"
        elif .Severity == "warning" then "minor"
        else "info"
        end
      ),
      location: {
        path: $file,
        lines: {
          begin: .Line,
          end: .Line
        }
      }
    }
  ]
' "$INPUT"
