# Etapa de construcción
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Imagen final
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/hola-mundo-1.0-SNAPSHOT.jar app.jar

# Expone el puerto donde corre tu app (ajusta si usás otro)
EXPOSE 8080

# Comando para correr el jar
ENTRYPOINT ["java", "-jar", "app.jar"]
