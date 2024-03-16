FROM ubuntu
ENV HTTP_PROXY=http://becpx-forti.res.bec.dk:80
ENV HTTPS_PROXY=http://becpx-forti.res.bec.dk:80
ENV NO_PROXY=.bec.dk
RUN echo -e '--insecure' >> .curlrc
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y curl

ENV DEBIAN_FRONTEND=noninteractive

RUN curl --insecure -s -o nodejs.tar.gz https://nodejs.org/dist/v20.11.0/node-v20.11.0-linux-x64.tar.gz
RUN mkdir /usr/local/lib/nodejs \
  && tar xf nodejs.tar.gz -C /usr/local/lib/nodejs/ --strip-components 1 \
  && rm nodejs.tar.gz

ENV PATH=/usr/local/lib/nodejs/bin:$PATH
RUN npm config set strict-ssl false
RUN npm install --global @salesforce/cli

RUN apt-get update && apt-get install --assume-yes openjdk-11-jdk-headless jq
RUN apt-get autoremove --assume-yes \
  && apt-get clean --assume-yes \
  && rm -rf /var/lib/apt/lists/*

ENV SF_CONTAINER_MODE true
ENV SFDX_CONTAINER_MODE true
ENV DEBIAN_FRONTEND=dialog
ENV SHELL /bin/bash