# Use official Maven image to build the app
FROM maven:3.8.1-openjdk-11 as build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml and download the dependencies (helps with caching)
COPY pom.xml .

# Download all dependencies (this will be cached if the dependencies are not changed)
RUN mvn dependency:go-offline

# Copy the source code to the container
COPY src /app/src

# Package the application (this will build the JAR file)
RUN mvn clean package -DskipTests

# Use OpenJDK 11 as the base image to run the app
FROM openjdk:11-jre-slim

# Copy the packaged JAR file from the build container
COPY --from=build /app/target/userapi-0.0.1-SNAPSHOT.jar /usr/app/userapi.jar

# Expose the port the app will run on
EXPOSE 8080

# Run the JAR file
ENTRYPOINT ["java", "-jar", "/usr/app/userapi.jar"]

