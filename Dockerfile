FROM ubuntu:latest

COPY vm_pub.pem /root/.ssh/authorized_keys

RUN apt-get update \
    && apt-get install -y openssh-server dotnet-sdk-8.0 \
    && mkdir /var/run/sshd \
    && chmod 640 /root/.ssh \
    && chmod 600 /root/.ssh/authorized_keys \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]