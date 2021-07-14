setup:
	make signing-key
	make server-cert

signing-key:
	chmod +x ./secure-boot.sh
	./secure-boot.sh

server-cert:
	rm -f ota_server_cert.pem && echo -n | openssl s_client -tls1_2 -showcerts -connect ${TF_VAR_gateway_domain}:443 | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > ./ota_server_cert.pem

aws-keys:
	chmod +x ./aws-keys.sh
	./aws-keys.sh
