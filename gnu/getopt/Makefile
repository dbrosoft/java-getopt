# Makefile for Java port of GNU getopt

JAVAC=${CHECKERFRAMEWORK}/checker/bin/javac
CP=${CHECKERFRAMEWORK}/checker/dist/checker-qual.jar
FLAGS=-source 7 -target 7 -AuseConservativeDefaultsForUnannotatedSourceCode
SOURCES=LongOpt.java Getopt.java GetoptDemo.java

all: 
	${JAVAC} -cp .:${CP} ${FLAGS} ${SOURCES}

docs: 
	javadoc -author -version -public Getopt.java LongOpt.java

