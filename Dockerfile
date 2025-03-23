FROM eclipse-temurin:21-jdk AS build
WORKDIR /app

ARG SECURITY_USER_NAME
ARG SECURITY_USER_PASSWORD

COPY . .
RUN ./mvnw clean package -DskipTests

FROM eclipse-temurin:21-jre
WORKDIR /app

ENV SECURITY_USER_NAME=$SECURITY_USER_NAME
ENV SECURITY_USER_PASSWORD=$SECURITY_USER_PASSWORD

COPY --from=build /app/target/discovery-service-0.0.1-SNAPSHOT.jar ./discovery-service.jar

EXPOSE 8761

ENTRYPOINT ["java", "-jar", "./discovery-service.jar"]
