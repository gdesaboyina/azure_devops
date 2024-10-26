FROM ubuntu:22.04
ENV TARGETARCH="linux-x64"
# Also can be "linux-arm", "linux-arm64".

ENV REQUESTS_CA_BUNDLE="/etc/ssl/certs/ca-certificates.crt"
ENV SSL_CERT_FILE="/etc/ssl/certs/ca-certificates.crt"

# update cache and packages
RUN apt-get update -y

RUN apt-get upgrade -y

RUN apt-get install -y  \
   curl \
   git \
   jq \
   libicu70 \
   python3 \
   python3-pip \
   python3-venv \
   zip unzip \
   p11-kit \
   dos2unix \
   wget \
   apt-transport-https \
   software-properties-common \
   sudo \
   ca-certificates \
   iproute2 \
   net-tools

ADD install_tools install_tools
RUN cd install_tools && ./main.sh

WORKDIR /azp/

COPY ./start.sh ./
RUN chmod +x ./start.sh

# Create agent user and set up home directory
RUN useradd -m -d /home/agent agent
RUN chown -R agent:agent /azp /home/agent
RUN echo 'agent ALL=(ALL) NOPASSWD:/usr/bin/hostname' >> /etc/sudoers

USER agent
# Another option is to run the agent as root.
# ENV AGENT_ALLOW_RUNASROOT="true"

ENTRYPOINT [ "./start.sh" ]
