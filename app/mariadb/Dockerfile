FROM  mariadb:11.8.1-noble-rc

RUN apt-get update

RUN apt-get install vim -y

RUN apt-get install netcat-traditional -y

COPY ./config/launch_script.sh /launch_script.sh

COPY ./config/updateDb.sh /updateDb.sh

RUN chmod +x /launch_script.sh

RUN chmod +x /updateDb.sh

ENTRYPOINT ["/bin/sh", "-c", "/launch_script.sh"]
