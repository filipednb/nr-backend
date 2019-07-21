FROM rigoford/alpine-java-newrelic

VOLUME /tmp

EXPOSE 80

RUN mkdir /app
WORKDIR /app
COPY . /app
RUN ./gradlew build

ENTRYPOINT ["java", "-javaagent:/opt/newrelic/newrelic.jar", "-jar", "./build/libs/backend-0.1.0.jar"]

