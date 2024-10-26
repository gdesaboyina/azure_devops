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

