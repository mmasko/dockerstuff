#!/bin/bash
REPO_URL=""
RUNNER_TOKEN_URL="${REPO_URL}/actions/runners/registration-token"
ACCESS_TOKEN="token_value"
_GITHUB_HOST=${GITHUB_HOST:="github.com"}
API_VERSION=v3
API_HEADER="Accept: application/vnd.github.${API_VERSION}+json"
AUTH_HEADER="Authorization: token ${ACCESS_TOKEN}"
RUNNER_TOKEN="$(curl -XPOST -fsSL \
  -H "${AUTH_HEADER}" \
  -H "${API_HEADER}" \
  "${RUNNER_TOKEN_URL}" \
| jq -r '.token')"
echo "{\"token\": \"${RUNNER_TOKEN}\", \"full_url\": \"${RUNNER_TOKEN_URL}\"}"