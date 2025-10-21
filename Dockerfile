# Usa una imagen oficial con JDK
FROM openjdk:17

# Crea un directorio de trabajo
WORKDIR /app

# Copia tu archivo Java
COPY src/main/java/com/example/App.java .

# Compila el archivo
RUN javac App.java

# Comando para ejecutar
CMD ["java", "App"]
