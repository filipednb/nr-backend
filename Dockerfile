FROM rigoford/alpine-java-newrelic

ENV APP_HOME=/usr/app/

WORKDIR $APP_HOME

COPY build.gradle settings.gradle gradlew $APP_HOME

COPY gradle $APP_HOME/gradle

RUN ./gradlew build || return 0

COPY . .

COPY ./build/libs/backend-0.0.1-SNAPSHOT.jar /usr/app/

ENTRYPOINT ["java","-jar","backend-0.0.1-SNAPSHOT.jar"]

CMD ["tail", "-f", "/dev/null"]