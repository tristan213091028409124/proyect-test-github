FROM maven:3.6.0-jdk-11-slim AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src//app
RUN mvn -f /usr/src/app/pom.xml clean package

FROM java:8
EXPOSE 8080
COPY --from=build /usr/src/app/target/project-test-github-1.0-SNAPSHOT.jar /usr/app/project-test-github-1.0-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/usr/app/project-test-github-1.0-SNAPSHOT.jar"]
