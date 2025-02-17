# Use the official Tomcat base image
FROM tomcat:latest

ARG warname

# Remove the default ROOT application
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy the .war file to the Tomcat webapps directory
COPY ${warname} /usr/local/tomcat/webapps/ROOT.war

# Expose the default Tomcat port
EXPOSE 8080