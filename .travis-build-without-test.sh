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

if [ -d "/tmp/git-scripts" ] ; then
  (cd /tmp/git-scripts && git pull -q) > /dev/null 2>&1
else
  (cd /tmp && git clone --depth 1 -q https://github.com/plume-lib/git-scripts.git)
fi

## Build Checker Framework

/tmp/git-scripts/git-clone-related typetools checker-framework
export CHECKERFRAMEWORK=`readlink -f ../checker-framework`

# This also builds annotation-tools
(cd ../checker-framework/ && ./.travis-build-without-test.sh downloadjdk jdk8)

echo "Exiting java-getopt/.travis-build-without-test.sh" in `pwd`
