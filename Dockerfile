FROM openjdk:8-jdk

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
 && apt-get -qq install -y nodejs                          \
 && npm update  -g                                         \
 && npm install -g typescript angular-cli || true

RUN node --version \
 && npm  --version \
 && ng   --version

ADD gradle /tmp
WORKDIR /tmp

RUN ./gradlew --no-daemon build \
 && rm -fR /tmp/*

WORKDIR /
