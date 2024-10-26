#!/bin/bash

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

ls -ltr /usr/local/bin/helm

helm version
