FROM maven AS builder

COPY . /

WORKDIR /

RUN mvn clean install

FROM openjdk:20-slim-buster


COPY --from=builder /target/spring-petclinic-2.6.0-SNAPSHOT.jar /app.jar

ENTRYPOINT ["java", "-jar", "/app.jar" ]
