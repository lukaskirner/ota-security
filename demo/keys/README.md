# Keys

## ota_server_cert.pem
Cert of the Api Gateway

## secure_boot_signing_key.pem
Used to sign firmware.
```
espsecure.py generate_signing_key secure_boot_signing_key.pem
```

**Note:** generate your own! This one is just here as exmaple and should **not** be used in production!!!

### How to generate mTLS certs?
Instructions can be found on a AWS article [Source](https://aws.amazon.com/blogs/compute/introducing-mutual-tls-authentication-for-amazon-api-gateway/)

## Test client cert
```
curl --key ota_client_cert.key --cert ota_client_cert.pem https://ota.kirner.ninja/
curl --key ota_client_cert.key --cert ota_client_cert.pem https://ota.kirner.ninja/ --output firmware.bin
```
