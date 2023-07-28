FROM marwaney/ssh-server:latest

ARG SSH_KEY_FILE='key.pub'
ENV SSH_KEY_FILE=${SSH_KEY_FILE}
COPY ${SSH_KEY_FILE} /home/worketyamo/.ssh/authorized_keys
RUN apt-get install python3 -y 