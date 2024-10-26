#!/bin/bash

trap "rm -f *.zip terraform LICENSE.txt" EXIT

tfversion=$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | jq .name | sed 's;";;g' | sed 's;^v;;g')

curl -LO https://releases.hashicorp.com/terraform/$tfversion/terraform_${tfversion}_linux_amd64.zip

unzip terraform_${tfversion}_linux_amd64.zip

cp terraform /usr/local/bin

chmod +x /usr/local/bin/terraform

ls -ltr /usr/local/bin/terraform

terraform --version
