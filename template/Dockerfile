# Base image with Java and Maven
FROM maven:3.8.3-openjdk-11-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml and build the project dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the application source code
COPY src/ /app/src/

# Build the application
RUN mvn package -DskipTests

# Final base image
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the built JAR file from the build stage
COPY --from=build /app/target/marketplace.jar .

# Expose the application port (change it to the port your app listens on)
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "marketplace.jar"]
