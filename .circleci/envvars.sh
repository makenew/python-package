#!/usr/bin/env bash

set -e
set -u

help () {
  echo
  echo '# This will set all required environment variables on the CircleCI project.'
  echo
  echo '# Supply values to set when prompted.'
  echo '# Values left blank will not be updated.'
  echo
  echo 'Values may also be provided via' \
       'the corresponding environment variable (prefixed with CI_).'
  echo 'Optionally, set NONINTERACTIVE=true to skip all prompts.'
  echo
  echo 'For example, assuming CIRCLE_TOKEN is set in your environment,' \
       'update PYPI_TOKEN with'
  echo
  echo '    $ NONINTERACTIVE=true CI_PYPI_PASSWORD=password .circleci/envvars.sh'
}

help_circleci_repo () {
  echo
  echo '> GitHub repository name, e.g., my-user/my-repo'
}

help_circleci_token () {
  echo
  echo '> Get a personal CircleCI API Token at' \
       'https://circleci.com/account/api'
}

envvar () {
  name=$1
  value=${2:-}
  if [[ -n $value ]]; then
    if [[ -z $circle_token ]]; then
      echo
      echo 'Error: missing CircleCI token.'
      exit 2
    fi

    curl -X POST \
      --header 'Content-Type: application/json' \
      -u "${circle_token}:" \
      -d '{"name": "'$name'", "value": "'$value'"}' \
      "https://circleci.com/api/v1.1/project/github/${circle_repo}/envvar"
  fi
}

main () {
  noninteractive=$1

  circle_repo=${CIRCLE_REPO:-}
  [[ -n "${circle_repo}" || $noninteractive == 'true' ]] || help_circleci_repo
  if [[ -z $circle_repo && $noninteractive != 'true' ]]; then
    read -p '> CircleCI Repo (CIRCLE_REPO): ' circle_repo
  fi

  circle_token=${CIRCLE_TOKEN:-}
  [[ -n "${circle_token}" || $noninteractive == 'true' ]] || help_circleci_token
  if [[ -z $circle_token && $noninteractive != 'true' ]]; then
    read -p '> CircleCI API token (CIRCLE_TOKEN): ' circle_token
  fi

  pypi_username=${CI_PYPI_USERNAME:-}
  if [[ -z $pypi_username && $noninteractive != 'true' ]]; then
    read -p '> PyPI username (PYPI_USERNAME): ' pypi_username
  fi

  pypi_password=${CI_PYPI_PASSWORD:-}
  if [[ -z $pypi_password && $noninteractive != 'true' ]]; then
    read -p '> PyPI password (PYPI_PASSWORD): ' pypi_password
  fi

  envvar 'PYPI_USERNAME' "${pypi_username}"
  envvar 'PYPI_PASSWORD' "${pypi_password}"
}

noninteractive=${NONINTERACTIVE:-false}
if [[ $noninteractive != 'true' ]]; then
  help
fi
main $noninteractive
