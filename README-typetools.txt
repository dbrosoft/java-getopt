This is a version of java-getopt that is annotated with type annotations for the Checker Framework.


To build this project
---------------------

```
make
```

The `.jar` file is found at, for example, `java-getopt-1.0.14-annotated.jar`.
It contains .class files, sources, and API documentation.


To update to a newer version of the upstream library
----------------------------------------------------

In the upstream repository, find the commit corresponding to a public release.

Pull in that commit:
git pull https://github.com/apache/commons-io <commitid>

Update the PACKAGE environment variable below.



To upload to Maven Central
--------------------------

# Set a new Maven Central version number in file cfMavenCentral.xml.

PACKAGE=java-getopt-1.0.14-annotated

make
# .md5 and .sha1 files don't get uploaded for uploads after the first one,
# if you use the same file.  So copy the file.
\cp -f ${PACKAGE}.jar ${PACKAGE}-sources.jar
\cp -f ${PACKAGE}.jar ${PACKAGE}-javadoc.jar


## This does not seem to work for me:
# -Dhomedir=/projects/swlab1/checker-framework/hosting-info

mvn gpg:sign-and-deploy-file -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ -DrepositoryId=sonatype-nexus-staging -DpomFile=cfMavenCentral.xml -Dgpg.publicKeyring=/projects/swlab1/checker-framework/hosting-info/pubring.gpg -Dgpg.secretKeyring=/projects/swlab1/checker-framework/hosting-info/secring.gpg -Dgpg.keyname=ADF4D638 -Dgpg.passphrase="`cat /projects/swlab1/checker-framework/hosting-info/release-private.password`" -Dfile=${PACKAGE}.jar \
&& \
mvn gpg:sign-and-deploy-file -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ -DrepositoryId=sonatype-nexus-staging -DpomFile=cfMavenCentral.xml -Dgpg.publicKeyring=/projects/swlab1/checker-framework/hosting-info/pubring.gpg -Dgpg.secretKeyring=/projects/swlab1/checker-framework/hosting-info/secring.gpg -Dgpg.keyname=ADF4D638 -Dgpg.passphrase="`cat /projects/swlab1/checker-framework/hosting-info/release-private.password`" -Dfile=${PACKAGE}-sources.jar -Dclassifier=sources \
&& \
mvn gpg:sign-and-deploy-file -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ -DrepositoryId=sonatype-nexus-staging -DpomFile=cfMavenCentral.xml -Dgpg.publicKeyring=/projects/swlab1/checker-framework/hosting-info/pubring.gpg -Dgpg.secretKeyring=/projects/swlab1/checker-framework/hosting-info/secring.gpg -Dgpg.keyname=ADF4D638 -Dgpg.passphrase="`cat /projects/swlab1/checker-framework/hosting-info/release-private.password`" -Dfile=${PACKAGE}-javadoc.jar -Dclassifier=javadoc
