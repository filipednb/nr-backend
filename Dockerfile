FROM rigoford/alpine-java-newrelic

COPY . .

RUN sh -c "./gradlew build -x test"

COPY ./build/libs/backend-0.0.1-SNAPSHOT.jar /usr/app/

WORKDIR /usr/app

RUN sh -c "touch backend-0.0.1-SNAPSHOT.jar'

ENTRYPOINT ["java","-jar","backend-0.0.1-SNAPSHOT.jar"]

CMD ["tail", "-f", "/dev/null"]