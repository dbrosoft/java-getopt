JAR=java-getopt-1.0.14-annotated.jar

jar: lib
	jar cf ${JAR} gnu

lib:
	(cd gnu/getopt && make)

clean:
	(cd gnu/getopt && rm -f *.class)
	rm -f ${JAR}

