FROM sds.redii.net/sds/java:1.8.0_72-ubuntu14.04.3

MAINTAINER Chulwoo Shin <cw1.shin@samsung.com>

RUN mkdir /var/myapp
COPY ./SpringReact/target/SpringReact-0.0.1-SNAPSHOT.jar /var/myapp

EXPOSE 8095
CMD ["java", "-jar", "/var/myapp/SpringReact-0.0.1-SNAPSHOT.jar"]
