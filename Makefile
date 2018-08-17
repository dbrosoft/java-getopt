JAR=java-getopt-1.0.14.0.1.jar

## TODO: should require clients to also include checker-qual.jar, rather than including it in a fat jar.
jar: clean lib
	jar cf ${JAR} gnu

lib:
	make -C gnu/getopt

clean:
	rm -f gnu/getopt/*.class
	find . -type f -name "*~" -exec rm -f {} \;
	rm -f ${JAR} TAGS
	rm -rf api

TAGS:
	etags gnu/getopt/*.java
