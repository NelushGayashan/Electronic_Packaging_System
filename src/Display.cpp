#include "Display.h"
#include <iostream>

void Display::initialize()
{
    std::cout << "Display initialized" << std::endl;
}

void Display::update(int parcelCount, int presetLength)
{
    std::cout << "Display update - Parcel Count: " << parcelCount
              << ", Preset Length: " << presetLength << std::endl;
}
