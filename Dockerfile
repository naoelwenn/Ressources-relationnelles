FROM openjdk:17-jdk-slim
WORKDIR /app
COPY api/target/*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]