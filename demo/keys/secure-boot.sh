#!/bin/sh
echo "Generating secure boot signing key ..."

if [[ -e ./secure_boot_signing_key.pem ]]; then
    echo "Necessary file already exist!"
else
    espsecure.py generate_signing_key secure_boot_signing_key.pem
fi