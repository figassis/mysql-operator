FROM oraclelinux:7.3

RUN yum install -y bind-utils iputils vim-enhanced sudo

COPY bin/linux_amd64/mysql-operator /

ENTRYPOINT ["/mysql-operator"]
