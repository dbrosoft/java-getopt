# Makefile for Java port of GNU getopt

FLAGS=-source 7 -target 7 -AuseConservativeDefaultsForUnannotatedSourceCode
JAVAC=${CHECKERFRAMEWORK}/checker/bin/javac

all: 
	${JAVAC} ${FLAGS} LongOpt.java Getopt.java GetoptDemo.java

docs: 
	javadoc -author -version -public Getopt.java LongOpt.java

