#!/bin/bash

trap "rm -f LICENSE.txt" EXIT

# python packages
python3 -m pip install --upgrade pip
python3 -m pip --version

echo "Installing Ansible and OCI CLI....."
python3 -m pip install \
   ansible \
   ansible-core==2.16 \
   pywinrm \
   oci-cli

# for ansible python compatability check https://docs.ansible.com/ansible/latest/reference_appendices/release_and_maintenance.html

echo " *****  Listing files....**********"
ls -ltr /usr/local/lib/python*/site-packages/oci_cli/bin/*

which oci
oci --version

# install az cli
echo "Installing Azure CLI....."
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install az cli devops extension
echo "Installing Azure DevOps CLI extension....."
az extension add --name azure-devops --allow-preview true
