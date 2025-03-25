FROM openjdk:21-jdk-slim

WORKDIR /app

COPY target/discovery-service-0.0.1-SNAPSHOT.jar discovery-service.jar

EXPOSE 8761

ENTRYPOINT ["java", "-Dspring.profiles.active=prod", "-jar", "discovery-service.jar"]