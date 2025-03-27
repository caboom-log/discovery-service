FROM openjdk:21-jdk-slim

WORKDIR /app

ARG SECURITY_USER_NAME
ARG SECURITY_USER_PASSWORD

COPY target/discovery-service-0.0.1-SNAPSHOT.jar discovery-service.jar

EXPOSE 8761

ENTRYPOINT ["java", "-jar", "discovery-service.jar"]