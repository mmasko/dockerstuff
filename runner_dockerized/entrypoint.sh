#!/bin/bash
RUNNER_SCOPE="org"
ORG_NAME="officeoftechnologyservices"
# REPO_URL="https://github.com/officeoftechnologyservices/example_repo"
ACCESS_TOKEN="$1"
REPO_NAME="$2"
REPO_URL="https://github.com/officeoftechnologyservices/${REPO_NAME}"

API_VERSION=v3
API_HEADER="Accept: application/vnd.github.${API_VERSION}+json"
AUTH_HEADER="Authorization: token ${ACCESS_TOKEN}"
_FULL_URL="https://api.github.com/repos/${ORG_NAME}/${REPO_NAME}/actions/runners/registration-token"

RUNNER_TOKEN="$(curl -XPOST -fsSL \
  -H "${AUTH_HEADER}" \
  -H "${API_HEADER}" \
  "${_FULL_URL}" \
| jq -r '.token')"
# echo "{\"token\": \"${RUNNER_TOKEN}\", \"full_url\": \"${_FULL_URL}\"}"
./config.sh --url ${REPO_URL} --token ${RUNNER_TOKEN}  --replace --name container_runner --work _work --runnergroup Default --labels 'container'
# echo ${RUNNER_TOKEN}