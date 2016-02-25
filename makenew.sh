#!/usr/bin/env sh

set -e
set -u

find_replace () {
  git ls-files -z | xargs -0 sed -i "$1"
}

check_env () {
  test -d .git || (echo 'This is not a Git repository. Exiting.' && exit 1)
  for cmd in ${1}; do
    command -v ${cmd} >/dev/null 2>&1 || \
      (echo "Could not find '$cmd' which is required to continue." && exit 2)
  done
  echo
  echo 'Ready to bootstrap your new project!'
  echo
}

stage_env () {
  echo
  git rm -f makenew.sh
  echo
  echo 'Staging changes.'
  git add --all
  echo
  echo 'Done!'
  echo
}

makenew () {
  read -p '> Package title: ' mk_title
  read -p '> Package name (slug): ' mk_slug
  read -p '> Package description: ' mk_description
  read -p '> Version number: ' mk_version
  read -p '> Author name: ' mk_author
  read -p '> Author email: ' mk_email
  read -p '> Copyright owner: ' mk_owner
  read -p '> Copyright year: ' mk_year
  read -p '> GitHub user or organization name: ' mk_user
  read -p '> GitHub repository name: ' mk_repo

  sed -i -e '22,123d;217,221d' README.rst
  sed -i -e "22i ${mk_description}" README.rst

  find_replace "s/__version__ =.*/__version__ = '${mk_version}'/g"
  find_replace "s/0\.0\.0\.\.\./${mk_version}.../g"
  find_replace "s/Python Package Skeleton/${mk_title}/g"
  find_replace "s/Python package skeleton\./${mk_description}/g"
  find_replace "s/2016 Evan Sosenko/${mk_year} ${mk_owner}/g"
  find_replace "s/Evan Sosenko/${mk_author}/g"
  find_replace "s/razorx@evansosenko\.com/${mk_email}/g"
  find_replace "s/makenew\/python-package/${mk_user}\/${mk_repo}/g"
  find_replace "s/makenew_python_package/${mk_slug}/g"

  git mv makenew_python_package ${mk_slug}

  mk_attribution='    Built from `makenew/python-package <https://github.com/makenew/python-package>`__.'
  sed -i -e "6i ${mk_attribution}\n" README.rst

  echo
  echo 'Replacing boilerplate.'
}

check_env 'git read sed xargs'
makenew
stage_env
exit
