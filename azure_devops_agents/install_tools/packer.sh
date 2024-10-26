#!/bin/bash

trap "rm -f *.zip packer LICENSE.txt" EXIT

pkrversion=$(curl -s https://api.github.com/repos/hashicorp/packer/releases/latest | jq .name | sed 's;";;g' | sed 's;^v;;g')

curl -LO https://releases.hashicorp.com/packer/$pkrversion/packer_${pkrversion}_linux_amd64.zip

unzip packer_${pkrversion}_linux_amd64.zip

cp packer /usr/local/bin

chmod +x /usr/local/bin/packer

packer --version
