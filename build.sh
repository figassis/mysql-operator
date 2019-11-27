#!/bin/bash
GO111MODULE=off
tag=latest
PKG=$GOPATH/src/github.com/oracle/mysql-operator

if [ ! -z "$1" ]; then
  tag=$1
fi;

rm -rf $PKG/bin && mkdir -p $PKG/bin/linux_amd64
GOOS=linux go build -ldflags "-X github.com/oracle/mysql-operator/pkg/version.buildVersion=${tag}" -o $PKG/bin/linux_amd64/mysql-agent $PKG/cmd/mysql-agent
GOOS=linux go build -ldflags "-X github.com/oracle/mysql-operator/pkg/version.buildVersion=${tag}" -o $PKG/bin/linux_amd64/mysql-operator $PKG/cmd/mysql-operator
docker build --rm --build-arg=http_proxy --build-arg=https_proxy -t figassis/mysql-agent:$tag -f $PKG/docker/mysql-agent/Dockerfile . && docker push figassis/mysql-agent:$tag
docker build --rm --build-arg=http_proxy --build-arg=https_proxy -t figassis/mysql-operator:$tag -f $PKG/docker/mysql-operator/Dockerfile .  && docker push figassis/mysql-operator:$tag
