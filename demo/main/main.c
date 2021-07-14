#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "esp_system.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"

#include "wifi/wifi.h"
#include "ota/ota.h"


// #define LED_GPIO 33 // <-- green LED
#define LED_GPIO 32 // <-- red LED

void app_main(void) {
    printf("Firmware upgrade demo!\n");
    for (int i = 3; i >= 0; i--) {
        printf("Starting programm in %d seconds...\n", i);
        vTaskDelay(1000 / portTICK_PERIOD_MS);
    }

    // establish internet connection
    printf("Establish WiFi connection.\n");
    fflush(stdout);
    initialise_wifi();

    // checking for new firmware and upgrade
    printf("Check for new firmware now.\n");
    fflush(stdout);
    xTaskCreate(&do_firmware_upgrade, "do_firmware_upgrade_task", 1024 * 8, NULL, 5, NULL);

    // configure LED
    gpio_reset_pin(LED_GPIO);
    gpio_set_direction(LED_GPIO, GPIO_MODE_OUTPUT);
    gpio_set_level(LED_GPIO, 1);
    printf("LED configured\n");
}