#!/usr/bin/env bash
# Vale JSON çıktısını JUnit XML formatına çevirir (GitLab CI artifacts:reports:junit için).
# Kullanım: vale --output=JSON . | vale-to-junit.sh > junit.xml
#           vale-to-junit.sh vale-results.json > junit.xml

set -euo pipefail

INPUT="${1:-/dev/stdin}"

TESTS=$(jq '[.[] | .[]] | length' "$INPUT")
FAILURES=$(jq '[.[] | .[] | select(.Severity == "error")] | length' "$INPUT")

echo '<?xml version="1.0" encoding="UTF-8"?>'
echo "<testsuite name=\"Vale Turkish\" tests=\"${TESTS}\" failures=\"${FAILURES}\">"

jq -r '
  to_entries[] |
  .key as $file |
  .value[] |
  if .Severity == "error" then
    "  <testcase name=\"\($file):\(.Line)\" classname=\"\(.Check)\"><failure message=\"\(.Message | gsub("&";"&amp;") | gsub("\"";"&quot;") | gsub("<";"&lt;") | gsub(">";"&gt;"))\" type=\"error\"/></testcase>"
  else
    "  <testcase name=\"\($file):\(.Line)\" classname=\"\(.Check)\"/>"
  end
' "$INPUT"

echo "</testsuite>"
