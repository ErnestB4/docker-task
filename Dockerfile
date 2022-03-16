# Pulls centos 7 image
FROM  centos:7

# Install terraform 1.0 && telnet && elinks
RUN yum install wget unzip -y && \
    wget https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_amd64.zip && \
    unzip terraform_1.0.0_linux_amd64.zip -d /usr/local/bin/ && \
    yum install telnet -y && \
    yum install elinks -y 

    # Remove Centos Packer and install Hashicorp packer
RUN unlink /usr/sbin/packer && \
    wget https://releases.hashicorp.com/packer/1.8.0/packer_1.8.0_linux_amd64.zip && \
    unzip packer_1.8.0_linux_amd64.zip -d /usr/local/bin/


# Set Labels 
LABEL name="sharedtools" \
      centos="terraform" \
      com.hashicorp.terraform.version=1.0.0 \
      com.hashicorp.packer.version=1.8.0 \
      base.Image.org.label-schema.vendor="CentOS" \
      created_by="devops"


# Expose container port 
EXPOSE 80
# Work Directory
WORKDIR /usr/local/bin/
# stay running after deployment
CMD [ "sleep", "infinity" ]