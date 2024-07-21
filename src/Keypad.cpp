#include "Keypad.h"
#include <iostream>
#include <cstdlib> // For rand()

void Keypad::initialize()
{
    std::cout << "Keypad initialized" << std::endl;
}

bool Keypad::isPressed()
{
    static bool keyPressed = false;
    keyPressed = !keyPressed;
    return keyPressed;
}

int Keypad::getInput()
{
    return rand() % 4;
}
