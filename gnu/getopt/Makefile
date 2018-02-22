# Makefile for Java port of GNU getopt

JAVAC=${CHECKERFRAMEWORK}/checker/bin/javac -target 7 -source 7 
FLAGS=-processor nullness
SOURCES=LongOpt.java Getopt.java GetoptDemo.java

all: 
	${JAVAC} -cp .:checker-qual7.jar ${FLAGS} ${SOURCES}

docs: 
	javadoc -d ../../api -author -version -public Getopt.java LongOpt.java

jar:
	${MAKE} -C ../.. jar
