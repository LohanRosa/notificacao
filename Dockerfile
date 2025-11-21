FROM gradle:7.5-jdk21 AS builder
WORKDIR /app
COPY . .
run gradle build --no-daemon

FROM azul/zulu-openjdk:21.0.8-jdk

WORKDIR /app

COPY --from=build /app/build/libs/*.jar /app/notificacao.jar

EXPOSE 8084

CMD ["java", "-jar", "/app/notificacao.jar"]
