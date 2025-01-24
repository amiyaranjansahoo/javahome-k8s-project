# Base image should be openjdk8 with alpine openjdk:8-jdk-alpine
# Declare the volume 
# Expose the 8095 port
# Add the jar present inside target folder and rename to app.jar
# Optionally pass an environment variable in case you want to override later
# Container start up command: "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar"
FROM openjdk:8-jdk-alpine
VOLUME /tmp
EXPOSE 8095
ADD target/*.jar app.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
