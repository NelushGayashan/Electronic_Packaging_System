ORG 0000H       ; Origin
SJMP MAIN       ; Jump to main program

; Interrupt vectors
ORG 0024H       ; Timer 0 interrupt
TIMER0_ISR:     ; Timer 0 Interrupt Service Routine
    ; Timer 0 ISR Code (e.g., update system time or perform periodic tasks)
    RETI        ; Return from interrupt

ORG 002BH       ; External interrupt 0
EXT_INT0_ISR:   ; External Interrupt 0 Service Routine (for sensors)
    ; Code to handle external interrupts (e.g., parcel detection)
    INC PARCEL_COUNT
    MOV A, PARCEL_COUNT
    MOV R0, A
    ; Update Seven-Segment Displays with parcel count
    ACALL SEG_DISPLAY
    RETI        ; Return from interrupt

; External RAM addresses
PARCEL_COUNT    DATA 30H ; Location to store parcel count
PRESET_LENGTH   DATA 31H ; Location to store preset length

; Port Definitions
PORT0           EQU 80H  ; Input from sensors
PORT1           EQU 90H  ; Keypad input
PORT2           EQU A0H  ; Seven-segment displays
PORT3           EQU B0H  ; Motors, solenoids

; Initialization routine
MAIN:           MOV SP, #70H       ; Initialize Stack Pointer
                MOV P0, #0FFH     ; Set Port 0 as input (sensors)
                MOV P1, #0FFH     ; Set Port 1 as input (keypad)
                MOV P2, #00H      ; Set Port 2 as output (displays)
                MOV P3, #00H      ; Set Port 3 as output (motors, solenoids)

                ; Initialize Timer 0
                MOV TMOD, #01H    ; Timer 0 mode 1 (16-bit timer)
                MOV TH0, #0FFH    ; Set timer high byte
                MOV TL0, #0FFH    ; Set timer low byte
                SETB TR0          ; Start Timer 0

                ; Initialize External Interrupt 0
                MOV IT0, #1       ; Interrupt 0 on falling edge
                SETB EX0          ; Enable External Interrupt 0
                SETB EA           ; Enable global interrupts

                ; Initialize External RAM
                MOV DPTR, #1001H   ; Point to external RAM address
                MOV A, #00H        ; Initialize external RAM (e.g., preset length)
                MOVX @DPTR, A

                ; Main control loop
MAIN_LOOP:      ; Read keypad input
                MOV A, P1         ; Read keypad
                CJNE A, #KEYPAD_VALUE, SKIP_KEYPAD

                ; Keypad pressed, process command
                ACALL PROCESS_KEYPAD

                ; Check parcel count and control motors/solenoids
                MOV A, PARCEL_COUNT
                CJNE A, #PRESET_LENGTH, SKIP_PROCESS

                ; Length matches, activate sealing
                SETB P3.0         ; Activate solenoid valve V1
                ACALL DELAY       ; Delay for sealing
                CLR P3.0          ; Deactivate solenoid valve V1

                ; Move to next parcel
                MOV A, P0         ; Read sensors
                CJNE A, #SENSOR_VALUE, SKIP_PROCESS
                MOV A, #0         ; Reset count if no parcel
                MOV PARCEL_COUNT, A

                ; Update display
                ACALL SEG_DISPLAY

                ; Continue main loop
                SJMP MAIN_LOOP

SKIP_KEYPAD:    SJMP MAIN_LOOP     ; Skip keypad processing

SKIP_PROCESS:   SJMP MAIN_LOOP     ; Skip processing if conditions not met

; Subroutine to process keypad input
PROCESS_KEYPAD:
                ; Implement logic to handle keypad input
                ; Example: Change preset length or system settings
                ; For now, just increment the preset length for demonstration
                MOV A, PRESET_LENGTH
                INC A
                MOV PRESET_LENGTH, A
                RET

; Subroutine to update seven-segment displays
SEG_DISPLAY:
                ; Code to update display based on R0 (parcel count)
                ; Convert R0 to 7-segment display format and output to Port 2
                MOV A, R0
                MOV P2, A          ; For simplicity, direct output (actual code may vary)
                RET

; Simple delay subroutine
DELAY:
                ; Implement a simple delay loop
                MOV R2, #255       ; Outer loop
DELAY_OUTER:
                MOV R1, #255       ; Inner loop
DELAY_INNER:
                DJNZ R1, DELAY_INNER
                DJNZ R2, DELAY_OUTER
                RET

END
