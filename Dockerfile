# Pull base image
FROM ubuntu:20.04

# prerequisites
RUN \
apt-get update -y && \
apt-get install -y curl && \
apt-get install -y apt-transport-https ca-certificates gnupg

# install google sdk
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-cli -y
