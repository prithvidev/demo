# Use Official OpenJDK 21 Base Image
FROM eclipse-temurin:21-jdk

# Set environment variables
ENV MAVEN_VERSION=3.9.9
ENV MAVEN_HOME=/opt/maven
ENV PATH="${MAVEN_HOME}/bin:${PATH}"

# Install Required Packages
RUN apt-get update && apt-get install -y curl unzip tar

# Download and Install Maven
RUN curl -fsSL "https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz" \
    | tar -xz -C /opt && mv /opt/apache-maven-${MAVEN_VERSION} ${MAVEN_HOME}

# Verify Installation
RUN java -version && mvn -version

# Set Working Directory
WORKDIR /app

# Default Command
CMD ["mvn"]
