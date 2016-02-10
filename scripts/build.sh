#!/bin/bash
set -e
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
# This script is meant to be run automatically
# as part of the jekyll-hook application.
# https://github.com/developmentseed/jekyll-hook

repo=$1
branch=$2
owner=$3
giturl=$4
source=$5
build=$6

# Check to see if repo exists. If not, git clone it
if [ ! -d $source ]; then
    git clone $giturl $source
fi

# Git checkout appropriate branch, pull latest code
cd $source
git checkout $branch
git pull origin $branch
cd -

# Run jekyll
cd $source
pwd
whoami
jekyll --version
jekyll build --source $source --destination $build
cd -
