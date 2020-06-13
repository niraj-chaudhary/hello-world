FROM alpine:3.7 as build
MAINTAINER Niraj Kumar
RUN apt-get update -y && apt-get install apache2 -y
COPY . /var/www/


FROM alpine:3.7
MAINTAINER Niraj Kumar
COPY --from=build /var/www/
EXPOSE 80 443
ENTRYPOINT ["apache2", "start"]
