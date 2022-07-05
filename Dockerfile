# ################################
# Base Image
# ################################
FROM ubuntu:20.04

# ################################
# Prerequisites
# ################################
RUN \
apt-get update -y && \
apt-get install -y wget curl apt-transport-https ca-certificates gnupg

# ################################
# Install Google SDK
# ################################
RUN \
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | \
tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && \
apt-get update -y && \
apt-get install google-cloud-cli -y

# ################################
# Install Terraform 0.13.6
# ################################
RUN \
wget https://releases.hashicorp.com/terraform/0.13.6/terraform_0.13.6_linux_amd64.zip && \
unzip terraform_0.13.6_linux_amd64.zip && \
mv terraform /usr/local/bin/
