#include "Motor.h"
#include <iostream>

void Motor::initialize()
{
    std::cout << "Motor initialized" << std::endl;
}

void Motor::start()
{
    std::cout << "Motor started" << std::endl;
}

void Motor::stop()
{
    std::cout << "Motor stopped" << std::endl;
}

void Motor::activateSolenoid()
{
    std::cout << "Solenoid activated" << std::endl;
}

void Motor::deactivateSolenoid()
{
    std::cout << "Solenoid deactivated" << std::endl;
}
