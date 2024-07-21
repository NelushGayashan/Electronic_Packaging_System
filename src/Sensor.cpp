#include "Sensor.h"
#include <iostream>

void Sensor::initialize()
{
    std::cout << "Sensor initialized" << std::endl;
}

bool Sensor::detectParcel()
{
    static bool parcelDetected = false;
    parcelDetected = !parcelDetected;
    return parcelDetected;
}
