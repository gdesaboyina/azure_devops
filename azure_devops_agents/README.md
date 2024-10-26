## This directory has the code for building a Docker image for Azure DevOps agents

## Docker Image has below builtin tools.

1. az cli
2. oracle cloud oci cli
3. Ansible
4. Terraform
5. Helm
6. Kubectl
7. Packer

Note: Addtional tools can be installed by placing a script in install_tools and adding that to main.sh

### Build a docker image

```bash
export tag=v2.0
docker build --no-cache --platform linux/amd64 --tag gdesaboyina/ubuntu-azdo-agent:$tag .
docker push gdesaboyina/ubuntu-azdo-agent:$tag
```

### Bring up the containers

```bash

export PROJECT=$HOSTNAME  # set the project name same as VM name that is running.
export AZP_URL=https://dev.azure.com/MyOrg # URL for your org
export AZP_POOL=MySelfhostedAgentPool  # Selfhosted Agent pool name. This needs to be created in advance from DevOps Portal
export AZP_TOKEN="mysecretazuredevopspattoken"  # This should have permissions to setup buildagents

```

### copy file contents to docker-compose.yaml in your favorite directory

```yaml
name: ${PROJECT}
services:
  oci-azdo-agent:
    image: gdesaboyina/azure_devops_agent:v2.0
    environment:
      - AZP_URL
      - AZP_TOKEN
      - AZP_POOL
    restart: unless-stopped
    deploy:
      mode: replicated
      replicas: 3
      
```

### bring up the containers using


```bash
docker-compose up -d
```
