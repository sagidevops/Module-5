# Build stage
FROM ubuntu
WORKDIR /opt/tomcat/.jenkins/workspace/Module 5
COPY . .
# Compile Stage
RUN mvn compile
# Test Stage
RUN mvn test
# Package Stage
RUN mvn package
# Copy WAR file to /WORKSPACE
RUN cp /opt/tomcat/.jenkins/workspace/Module 5/target/hello-world-war-1.0.0.war /opt/tomcat/.jenkins/workspace/Module 5