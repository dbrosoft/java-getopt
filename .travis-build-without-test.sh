#!/bin/bash

echo "Entering java-getopt/.travis-build-without-test.sh" in `pwd`

# Fail the whole script if any command fails.
set -e

export SHELLOPTS

export JAVA_HOME=${JAVA_HOME:-$(dirname $(dirname $(dirname $(readlink -f $(/usr/bin/which java)))))}

export JSR308=..
export AFU=../annotation-tools/annotation-file-utilities
export CHECKERFRAMEWORK=`realpath ../checker-framework`

export PATH=$AFU/scripts:$JAVA_HOME/bin:$PATH

git -C /tmp/plume-scripts pull > /dev/null 2>&1 \
  || git -C /tmp clone --depth 1 -q https://github.com/plume-lib/plume-scripts.git
SLUGOWNER=`/tmp/plume-scripts/git-organization typetools`

## Build Checker Framework

if [ -d ../checker-framework ] ; then
    # Older versions of git don't support the -C command-line option
    (cd ../checker-framework && git pull)
else
  REPO=`/tmp/plume-scripts/git-find-fork ${SLUGOWNER} typetools checker-framework`
  BRANCH=`/tmp/plume-scripts/git-find-branch ${REPO} ${TRAVIS_PULL_REQUEST_BRANCH:-$TRAVIS_BRANCH}`
  (cd .. && git clone -b ${BRANCH} --single-branch --depth 1 -q ${REPO} checker-framework) || (cd .. && git clone -b ${BRANCH} --single-branch --depth 1 -q ${REPO} checker-framework)
  # This also builds annotation-tools and jsr308-langtools
  (cd ../checker-framework/ && ./.travis-build-without-test.sh downloadjdk)
fi
export CHECKERFRAMEWORK=`readlink -f ../checker-framework`

# This also builds annotation-tools and jsr308-langtools
(cd ../checker-framework/ && ./.travis-build-without-test.sh downloadjdk jdk8)

echo "Exiting java-getopt/.travis-build-without-test.sh" in `pwd`
