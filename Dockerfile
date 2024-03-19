# Use the official Tomcat image as the base image
FROM tomcat:latest

# Set the working directory to /usr/local/tomcat

RUN apt-get update && apt-get install -y git

 RUN apt-get update && \
     apt-get install -y maven 

RUN mkdir /app
WORKDIR /app
 RUN mvn clean package
COPY . .
 #WORKDIR /usr/local/tomcat


# Copy your WAR file from the local filesystem into the container at /usr/local/tomcat/webapps
#COPY target/**.*war webapps/


# Expose the default Tomcat port
EXPOSE 8085

# Start Tomcat when the container launches
CMD ["catalina.sh", "run"]
