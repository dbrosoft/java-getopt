# Makefile for Java port of GNU getopt

JAVAC=${CHECKERFRAMEWORK}/checker/bin/javac -target 7 -source 7 
CP=${CHECKERFRAMEWORK}/checker/dist/checker-qual.jar
FLAGS=-processor nullness -AuseConservativeDefaultsForUnannotatedSourceCode -AprintErrorStack
SOURCES=LongOpt.java Getopt.java GetoptDemo.java

all: 
	${JAVAC} -cp .:${CP} ${FLAGS} ${SOURCES}

docs: 
	javadoc -author -version -public Getopt.java LongOpt.java

