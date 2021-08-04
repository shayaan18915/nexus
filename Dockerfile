FROM openjdk:12-alpine
COPY ./target/star-0.0.1-SNAPSHOT.jar /star-0.0.1-SNAPSHOT.jar
CMD ["java","-jar", "/star-0.0.1-SNAPSHOT.jar"]
