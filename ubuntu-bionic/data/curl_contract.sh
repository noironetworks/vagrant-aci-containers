#!/bin/bash

curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"tenant":"kube","name":"all-all"}' \
  http://localhost:14443/gbp/contracts
