FROM rigoford/alpine-java-newrelic

ENV APP_HOME=/usr/app/

WORKDIR $APP_HOME

COPY build.gradle settings.gradle gradlew $APP_HOME

COPY gradle $APP_HOME/gradle

COPY . .

RUN ./gradlew build

COPY ./build/libs/backend-0.0.1-SNAPSHOT.jar /usr/app/

ENTRYPOINT ["java","-jar","backend-0.0.1-SNAPSHOT.jar"]

CMD ["tail", "-f", "/dev/null"]