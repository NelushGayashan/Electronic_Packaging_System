#ifndef MOTOR_H
#define MOTOR_H

class Motor
{
public:
    void initialize();
    void start();
    void stop();
    void activateSolenoid();
    void deactivateSolenoid();
};

#endif // MOTOR_H
