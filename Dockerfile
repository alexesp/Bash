FROM ubuntu:20.04

#Instalar openssh-server
USER root

RUN apt-get update && apt-get install openssh-server -y
RUN apt-get update && apt-get upgrade -y sudo
#RUN apt-get openssh-server
#Crear usuario
RUN groupadd g_docker

#Crear usuario 
#ARG USER=alex
#ARG PASS="toor"
RUN useradd -d /home/alex -m -s /bin/bash -g g_docker alex
#RUN useradd -m -s /bin/bash ${USER} - g g_docker alex
#Estableser password
RUN echo "toor\ntoor" | passwd alex

#Start ssh server
RUN service ssh start

#Mapeo de puerto 22
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
#Start contenedor
#docker run -d -p 2022:22 ubuntu-ssh