# Etapa de construcción
FROM maven:3.8.1-openjdk-17-slim AS builder
WORKDIR /build
COPY . .
RUN mvn clean package -DskipTests

# Etapa de ejecución
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=builder /build/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
