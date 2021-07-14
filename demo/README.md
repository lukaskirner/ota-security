# OTA firmware update example


## Setup
### WiFi connection
Create the `./main/secrets.h` file with the following content:
```
#define WIFI_SSID "Your SSID"
#define WIFI_PASSPHARSE "Password for SSID"
```

### Build, flash & monitor
```
~/.espressif/python_env/idf4.2_py3.9_env/bin/python /Users/lukaskirner/esp/esp-idf/tools/idf.py build
~/.espressif/python_env/idf4.2_py3.9_env/bin/python /Users/lukaskirner/esp/esp-idf/tools/idf.py flash monitor
```

### Erase flash
```
~/.espressif/python_env/idf4.2_py3.9_env/bin/python /Users/lukaskirner/esp/esp-idf/tools/idf.py erase_flash
```


### Secruity features
- Sign binaries during build
    -  add relative path to ECDSA private key in PEM format
- Partition table
    - Getting some place for OTA updates
    - `Factory App, two OTA definitions`
- Offset partition table
    - Is necessary because bootloader is bigger with verification of signed FW (otherwise overlapping)
    - 8.000 --> 10.000
