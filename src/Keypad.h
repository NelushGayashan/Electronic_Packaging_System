#ifndef KEYPAD_H
#define KEYPAD_H

class Keypad
{
public:
    void initialize();
    bool isPressed();
    int getInput();
};

#endif // KEYPAD_H
