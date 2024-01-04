FROM alpine:latest

WORKDIR /devcontainer

COPY . .

RUN chmod +x setup.sh
RUN chmod +x user-setup.sh

RUN ./setup.sh
RUN ./user-setup.sh

RUN sudo service sshd restart 
