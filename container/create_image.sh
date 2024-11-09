#!/bin/bash

rm -R target/*
rm oracle_migrate_1.0.0.0.zip

podman rmi oracle_migrate:1.0.0.0
podman build -t oracle_migrate:1.0.0.0 .
podman save localhost/oracle_migrate:1.0.0.0 > target/oracle_migrate_1.0.0.0.tar

cd target/
zip -r ../oracle_migrate_1.0.0.0.zip .