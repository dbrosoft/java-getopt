# java-getopt
A Java option processor 100% compatible with the GNU C Library getopt

Changes from https://github.com/arenn/java-getopt
(97d3ac8d79fc0b0e6f8dcc46fb5c7db5f7ca26ff, 8 Feb 2012):
  * Annotated Getopt and LongOpt for nullness checker
  * Added top-level Makefile for building java-getopt-<version>-annotated.jar
To see the differences,
  git diff 97d3ac8d79fc0b0e6f8dcc46fb5c7db5f7ca26ff..
or:
  git clone https://github.com/arenn/java-getopt.git ../java-getopt-upstream
  git pull -C ../java-getopt-upstream
  diff -u --recursive --exclude=.git --exclude='*.class' --exclude='*~' ../java-getopt-upstream .

This fork depends on the Checker Framework
(https://types.cs.washington.edu/checker-framework/).  Building the
project requires that the CHECKERFRAMEWORK environment variable be set.

