#include "EPSController.h"
#include "Motor.h"
#include "Sensor.h"
#include "Display.h"
#include "Keypad.h"
#include <chrono>
#include <thread>

EPSController::EPSController()
    : motor1(), motor2(), sensor(), display(), keypad(), parcelCount(0), presetLength(10) {}

void EPSController::initialize()
{
    motor1.initialize();
    motor2.initialize();
    sensor.initialize();
    display.initialize();
    keypad.initialize();
}

void EPSController::start()
{
    while (true)
    {
        if (keypad.isPressed())
        {
            handleKeypadInput();
        }
        if (sensor.detectParcel())
        {
            handleParcel();
        }
        updateDisplay();
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
    }
}

void EPSController::handleKeypadInput()
{
    int keyValue = keypad.getInput();

    switch (keyValue)
    {
    case 1:
        presetLength++;
        break;
    case 2:
        if (presetLength > 1)
        {
            presetLength--;
        }
        break;
    case 3:
        parcelCount = 0;
        break;
    default:
        break;
    }
}

void EPSController::handleParcel()
{
    if (parcelCount < presetLength)
    {
        motor1.start();
        motor2.start();

        motor1.activateSolenoid();
        std::this_thread::sleep_for(std::chrono::milliseconds(500));
        motor1.deactivateSolenoid();
        motor2.stop();

        parcelCount++;
    }
    else
    {
        motor1.stop();
        motor2.stop();
    }
}

void EPSController::updateDisplay()
{
    display.update(parcelCount, presetLength);
}
