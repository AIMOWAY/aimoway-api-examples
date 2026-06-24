#!/usr/bin/env bash
set -euo pipefail

if [ -z "${AIMOWAY_API_KEY:-}" ]; then
  echo "Error: AIMOWAY_API_KEY is not set." >&2
  echo "Run: export AIMOWAY_API_KEY='your_aimoway_api_key_here'" >&2
  exit 1
fi

curl https://aimoway.com/v1/chat/completions \
  -H "Authorization: Bearer ${AIMOWAY_API_KEY}" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "DeepSeek-V3.2",
    "messages": [
      {
        "role": "system",
        "content": "You are a concise and helpful assistant."
      },
      {
        "role": "user",
        "content": "Give me one practical idea for testing an LLM API."
      }
    ],
    "temperature": 0.2,
    "max_tokens": 128
  }'
