#!/bin/bash

echo "This script allows to properly configure the docker container running the Hawkbit Server, using the key you just generated."
echo "Please follow the guide on FullMetalUpdate/documentation on Github for more informations."
echo

cd hawkbit
key=$(ls *.jks)

sed --in-place='.sample' 's/key-file/'$key'/' application.properties
sed --in-place='.sample' 's/key-file/'$key'/g' Dockerfile

read -sp 'Please enter the password of your newly-generated key : ' password
echo

sed -i 's/p12-password/'$password'/g' application.properties

echo "You can now build the docker image."