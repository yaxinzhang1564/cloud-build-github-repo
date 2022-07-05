# ################################
# Base Image
# ################################
FROM ubuntu:20.04
WORKDIR /home/cloud_service
ENV DEBIAN_FRONTEND=noninteractive 

# ################################
# Prerequisites
# ################################
RUN \
apt-get update -y && \
apt-get install -y \
  apt-transport-https\
  ca-certificates \
  curl \
  git \
  gnupg \
  openssh-client \
  unzip \  
  wget

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
mv terraform /usr/local/bin/ && \
rm terraform_0.13.6_linux_amd64.zip

# ################################
# Clone my bogus terraform repositary and python script repositary
# ################################
# copy ssh key
COPY . /
# clone github repositories using ssh
RUN \
eval "$(ssh-agent -s)" && \
ssh-add /ssh_keys/id_ecdsa && \
git config --global core.sshCommand 'ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no' && \
git clone git@github.com:yaxinzhang1564/bogus-github-tf-repo.git && \
git clone git@github.com:yaxinzhang1564/bogus-github-scripts-repo.git

# ################################
# Install Python 3.8
# ################################
RUN \
apt-get update && \
apt-get install -y software-properties-common && \
add-apt-repository ppa:deadsnakes/ppa -y -u && \
apt-get update && \
apt-get install -y python3.8
RUN python3 --version

# ################################
# Examine the installation
# ################################
CMD \
echo "******* Examination: \n" && \
echo "$(ls -al /home/cloud_service)\n"
