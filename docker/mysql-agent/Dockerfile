FROM mysql/mysql-server:8.0.18

RUN yum install -y bind-utils iputils vim-enhanced sudo

COPY bin/linux_amd64/mysql-agent /

#USER mysql
USER root

ENTRYPOINT ["/mysql-agent"]
