#!/bin/sh
echo "Generating mTLS keys for AWS Api Gateway ..."

if [[ -e ./my_client.key && -e ./my_client.pem && -e ./truststore.pem ]]; then
    echo "Necessary files already exist! Skip generating."
else
    # Create client
    openssl genrsa -out my_client.key 2048
    openssl req -config cert_config.txt -new -x509 -days 3650 -key my_client.key -out my_client.pem

    # Create truststore
    cp my_client.pem truststore.pem
fi

# https://aws.amazon.com/blogs/compute/introducing-mutual-tls-authentication-for-amazon-api-gateway/
