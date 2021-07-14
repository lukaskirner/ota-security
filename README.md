# Secure Over-the-air (OTA) firmware updates for microcontrollers like ESP32 - Seminararbeit
This is a paper that was written by me at the Munich University of Applied Sciences in the course of the main seminar in the summer semester 2021. This repository incldues the paper (`./latex`) and the implementation code (`./demo`).

## Testing
### Requirements
1. AWS Account
2. Domain hosted in AWS Route53
3. ESP32 (hardware)
4. Python3.8+
5. OpenSSL
6. aws-cli
7. terraform
8. VS Code
9. [esp-idf extension for VS Code](https://marketplace.visualstudio.com/items?itemName=espressif.esp-idf-extension)

### Four step setup (Unix systems)
1. Install the required tools
    - aws-cli (also configure it with your credentials)
    - terraform
    - esp-idf extension for VS Code (install esp-idf with this extension)
2. Open shell inside the `demo` folder and execute `setup.sh`
3. Build & flash firmware to your ESP32
    - create `./main/secrets.h` with your WiFi settings:
        ```
        #define WIFI_SSID <ssid>
        #define WIFI_PASSPHARSE <password>
        ```
    - build firmware
    - flash firmware to ESP32
4. Build & upload new firmware
    - change version string inside `version.txt`
    - build new firmware but clean build folder before
    - upload to firmware S3 bucket

Now if you start monitoring your ESP32 with the old firmware you will see the ESP32 trying to connect to your configured WiFi network. After successfully connecting to the WiFi it tries to get the new firmware. If you have done everythin right you will see your device reboot wiht the new firmware.

### Four step setup (Windows systems)
1. Use WSL: [link](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
