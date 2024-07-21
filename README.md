# Electronic_Packaging_System (EPS)

## Overview

The EPS (Electronic Packaging System) Project is a C++ application for controlling an electronic packaging system using an 8051 microcontroller. The project is structured using Object-Oriented Programming (OOP) principles and follows a modular design for easy management and expansion.

## Project Structure
```bash
EPS_Project/
│
├── src/
│ ├── main.cpp
│ ├── EPSController.cpp
│ ├── EPSController.h
│ ├── Motor.cpp
│ ├── Motor.h
│ ├── Sensor.cpp
│ ├── Sensor.h
│ ├── Display.cpp
│ ├── Display.h
│ └── Keypad.cpp
│ └── Keypad.h
│
├── include/
  ├── EPSController.h
  ├── Motor.h
  ├── Sensor.h
  ├── Display.h
  └── Keypad.h
```


## Components

- **EPSController**: Manages the overall system operation, including motor control, sensor input, display updates, and keypad handling.
- **Motor**: Controls the motors used for feeding and exiting parcels, including solenoid activation.
- **Sensor**: Detects the presence of parcels.
- **Display**: Updates the display with the current parcel count and preset length.
- **Keypad**: Handles user input for adjusting preset lengths and resetting counts.

## Building the Project

To build the project, you need to use CMake. Follow these steps:

1. **Install CMake**: Ensure that CMake is installed on your system. You can download it from [CMake's official website](https://cmake.org/download/).

2. **Generate Build Files**:
   Open a terminal and navigate to the project directory. Run the following commands:

   ```bash
   mkdir build
   cd build
   cmake ..
   ```

3. Build the Project:
    After generating the build files, compile the project using:

   ```bash
   cmake --build .
   ```

4. Run the Executable:
   After the build process completes, you will find the executable EPS_Project in the build directory. Run it with:

   ```bash
    ./EPS_Project
   ```

## Dependencies

- CMake: For managing the build process.
- C++11: The project is set to use C++11 standards.

## Folder Description

- src/: Contains the source files for the project implementation.
    - main.cpp: Entry point of the application.
    - EPSController.cpp, Motor.cpp, Sensor.cpp, Display.cpp, Keypad.cpp: Implementations of the respective classes.

- include/: Contains header files for class declarations.
    - EPSController.h, Motor.h, Sensor.h, Display.h, Keypad.h: Class interfaces.

## Example Usage

The main.cpp file contains the entry point of the application. It initializes the EPSController and starts the control loop:

```bash
#include "EPSController.h"

int main() {
    EPSController eps;
    eps.initialize();
    eps.start();
    return 0;
}
```

## Contributing

Contributions to the project are welcome. Please fork the repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License. See the LICENSE file for details.