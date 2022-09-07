FROM openjdk:20-slim-buster



COPY /target/spring-petclinic-2.6.0-SNAPSHOT.jar /app.jar

ENTRYPOINT ["java", "-jar", "/app.jar" ]
