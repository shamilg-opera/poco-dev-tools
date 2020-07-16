#!/bin/bash

set -e

./aju.sh project create-conf

echo Destroying containers...
./aju.sh docker stop all
./aju.sh docker destroy all
docker volume prune -f

echo Creating containers...

./aju.sh docker create all
./aju.sh docker start all

echo Creating tables and filling test data...

./aju.sh db build all -t
./aju.sh db local-rebuild -t -d

echo DB has been rebuilt.

echo Project config renewed, please import it.
