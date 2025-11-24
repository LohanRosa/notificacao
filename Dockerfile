FROM gradle:8.7-jdk21 AS builder
WORKDIR /app
COPY . .
RUN gradle build --no-daemon

FROM azul/zulu-openjdk:21.0.8-jdk

WORKDIR /app

COPY --from=builder /app/build/libs/*.jar /app/notificacao.jar

EXPOSE 8084

CMD ["java", "-jar", "/app/notificacao.jar"]
