JAR=java-getopt-1.0.14-annotated.jar

jar: clean lib
	jar xf ${CHECKERFRAMEWORK}/checker/dist/checker-qual.jar
	jar cf ${JAR} gnu org
	rm -rf META-INF org

lib:
	make -C gnu/getopt

clean:
	rm -f gnu/getopt/*.class
	find . -type f -name "*~" -exec rm -f {} \;
	rm -f ${JAR} TAGS
	rm -rf api

TAGS:
	etags gnu/getopt/*.java
