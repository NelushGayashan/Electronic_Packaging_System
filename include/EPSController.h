#ifndef EPSCONTROLLER_H
#define EPSCONTROLLER_H

#include "Motor.h"
#include "Sensor.h"
#include "Display.h"
#include "Keypad.h"

class EPSController
{
public:
    EPSController();
    void initialize();
    void start();

private:
    void handleKeypadInput();
    void handleParcel();
    void updateDisplay();

    Motor motor1;
    Motor motor2;
    Sensor sensor;
    Display display;
    Keypad keypad;
    int parcelCount;
    int presetLength;
};

#endif // EPSCONTROLLER_H
