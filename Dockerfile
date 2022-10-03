# Build stage
FROM openjdk:11.0.15-jre
RUN curl -fsSL -o apache-maven.tar.gz https://apache.osuosl.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz \
&& tar -xzf apache-maven.tar.gz \
&& rm -rf apache-maven.tar.gz \
&& ln -s /apache-maven-3.8.6/bin/mvn /usr/bin/mvn
COPY . .
# Compile Stage
RUN mvn compile
# Test Stage
RUN mvn test
# Package Stage
RUN mvn package
# Copy WAR file to /WORKSPACE
RUN cp /target/hello-world-war-1.0.0.war /opt/tomcat/.jenkins/workspace/Module-5 .
RUN rm -rf sagi-nir-module-5 sagi-nir-module-5@tmp target src README.md