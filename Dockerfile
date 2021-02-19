FROM openjdk:11-buster

RUN wget https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/5.0.1/openapi-generator-cli-5.0.1.jar -O /usr/local/bin/openapi-generator-cli.jar  \
        && echo "java -jar /usr/local/bin/openapi-generator-cli.jar \$@" > /usr/local/bin/openapi-generator-cli  \
        && chmod +x /usr/local/bin/openapi-generator-cli

ENV GOLANG_VERSION=1.15.4
RUN curl -O https://storage.googleapis.com/golang/go${GOLANG_VERSION}.linux-amd64.tar.gz  \
        && tar -xvf go${GOLANG_VERSION}.linux-amd64.tar.gz  \
        && mv go /usr/local  \
        && rm go${GOLANG_VERSION}.linux-amd64.tar.gz

ENV GOROOT=/usr/local/go
ENV GOPATH=/go
ENV PATH=$PATH:/usr/local/go/bin:/go/bin
ENV GO111MODULE=on

RUN apt-get update  \
    && apt-get install make

WORKDIR /workspace