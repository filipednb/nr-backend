FROM rigoford/alpine-java-newrelic

VOLUME /tmp

RUN mkdir /app
WORKDIR /app
COPY . /app
COPY newrelic.yml /opt/newrelic/newrelic.yml
RUN ./gradlew build

EXPOSE 8080:8080

ENTRYPOINT ["java", "-javaagent:/opt/newrelic/newrelic.jar", "-jar", "./build/libs/backend-0.0.1.jar"]

