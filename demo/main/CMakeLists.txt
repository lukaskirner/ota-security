idf_component_register(SRCS "main.c" "ota/ota.c" "wifi/wifi.c"
                    INCLUDE_DIRS "."
                    EMBED_TXTFILES ../keys/ota_server_cert.pem ../keys/my_client.key ../keys/my_client.pem)