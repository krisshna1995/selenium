FROM maven:3.9-eclipse-temurin-17

WORKDIR /app

# Cache dependencies
COPY pom.xml .
RUN mvn -B dependency:go-offline -q

# Copy project sources
COPY src ./src
COPY config ./config

# Default environment values
ENV ENV=qa
ENV BROWSER=chrome
ENV HEADLESS=true

CMD mvn -B test -Denv=$ENV -Dbrowser=$BROWSER -Dheadless=$HEADLESS
