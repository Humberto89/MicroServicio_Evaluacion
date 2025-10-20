# Etapa de construcción
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

# Imagen final
FROM openjdk:17-jdk-slim
COPY --from=build /app/target/hola-mundo-1.0.0.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
