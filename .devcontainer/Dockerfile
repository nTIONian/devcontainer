FROM alpine:latest

WORKDIR /devcontainer

COPY . .

RUN chmod +x setup.sh
RUN sudo chmod +x user-setup.sh

RUN ./setup.sh

USER dev
RUN ./user-setup.sh

RUN sudo service sshd restart 
