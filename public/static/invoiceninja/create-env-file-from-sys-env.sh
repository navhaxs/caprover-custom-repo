#!/bin/sh

for ENV_VAR in $(echo $ENV_LIST | tr "," "\n")
do
  if grep -q "^$ENV_VAR=" .env; then
    sed -i "s/$ENV_VAR=.*/$ENV_VAR=$(printenv $ENV_VAR)/g" .env
  else
    echo "$ENV_VAR=$(printenv $ENV_VAR)" >> .env
  fi
done

mkdir -p /var/www/app/docker-backup-public
