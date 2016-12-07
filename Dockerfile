FROM openjdk:8-jdk

ADD gradle /tmp
WORKDIR /tmp

RUN ./gradlew --no-daemon build
