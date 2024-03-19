# # Use the official Tomcat image as the base image
# FROM tomcat:latest

# # Set the working directory to /usr/local/tomcat

# RUN apt-get update && apt-get install -y git

#  RUN apt-get update && \
#      apt-get install -y maven 

# RUN mkdir /app
# WORKDIR /app
#  RUN mvn clean package
# COPY . .
#  #WORKDIR /usr/local/tomcat


# # Copy your WAR file from the local filesystem into the container at /usr/local/tomcat/webapps
# #COPY target/**.*war webapps/


# # Expose the default Tomcat port
# EXPOSE 8085

# # Start Tomcat when the container launches
# CMD ["catalina.sh", "run"]


FROM maven:3.8.3-jdk-11 AS build

WORKDIR /app

# Clone the Git repository
RUN git clone https://github.com/Abhi96chawla/maven-project.git /app

# Change directory to the project root
WORKDIR /app

# Run Maven build
RUN mvn clean install
RUN mvn package
RUN ls -l
cd webapp/target/
RUN ls -l
RUN pwd
#COPY ${WORKSPACE}/webapp/target/**.*war /opt/tomcat/webapps
EXPOSE 8085
CMD ["catalina.sh", "run"]
# Your further Dockerfile instructions...

