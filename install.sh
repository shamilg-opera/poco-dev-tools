#!/bin/bash

set -e

function newlink {
    if [ -L ../poco/$1 ]; then
	rm ../poco/$1
    fi
    ln -s `pwd`/$1 ../poco/$1
}
echo "Setting up symlinks..."
newlink rebuild-db.sh
echo -e "o rebuild-db.sh\t\tOK"
newlink db.sh
echo -e "o db.sh\t\t\tOK"
newlink conf-gen.sh
echo -e "o conf-gen.sh\t\tOK"
echo "Setup is done."
