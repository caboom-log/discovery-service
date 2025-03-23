FROM openjdk:21-jdk-slim

ENV SECURITY_USER_NAME=${SECURITY_USER_NAME}
ENV SECURITY_USER_PASSWORD=${SECURITY_USER_PASSWORD}

WORKDIR /app

COPY target/discovery-service-0.0.1-SNAPSHOT.jar discovery-service.jar

EXPOSE 8761

ENTRYPOINT ["java", "-jar", "discovery-service.jar"]
