# Étape 1 : build
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY api/pom.xml .
COPY api/src ./src
RUN mvn clean package -DskipTests

# Étape 2 : runtime
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]
