FROM maven:3.8.3-jdk-11 AS build

WORKDIR /app

# Clone the Git repository
RUN git clone https://github.com/Abhi96chawla/maven-project.git /app

# Change directory to the project root
WORKDIR /app

# Run Maven build
RUN mvn clean install
RUN mvn package
RUN ls -l webapp/target/
RUN ls -l /usr/local/tomcat/webapps
COPY webapp/target/*.war /usr/local/tomcat/webapps
RUN pwd

EXPOSE 8085
CMD ["catalina.sh", "run"]
