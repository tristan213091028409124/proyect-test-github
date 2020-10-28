FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM java:8
EXPOSE 8080
ADD /target/project-test-github-1.0-SNAPSHOT.jar project-test-github-1.0-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","project-test-github-1.0-SNAPSHOT.jar"]
