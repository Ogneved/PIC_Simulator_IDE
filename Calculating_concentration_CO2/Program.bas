'На базе МК и датчика MQ-135 разработать схему и прошивку устройства,
'контролирующего концентрацию СО2 в помещении с цветовой индикацией и
'выводом информации на LCD и в UART.

'PIC16F877A

Hseropen 9600  'Open hardware UART port for data transfer speed 9600

'Configuring the LCD module the ports of the microcontroller
Define LCD_LINES = 2  'Number of rows in LCD
Define LCD_CHARS = 16  'Number of characters in LCD
Define LCD_BITS = 8  '8-bit data bus
Define LCD_DREG = PORTB  'A data output port for LCD
Define LCD_DBIT = 0  'First 4 port outputs
Define LCD_RSREG = PORTD  'The port output controller input RS of LCD
Define LCD_RSBIT = 1  'The number of the output controller to the input RS of LCD
Define LCD_EREG = PORTD  'Controller output port to E LCD input
Define LCD_EBIT = 3  'The number of the output controller input E LCD
Define LCD_RWREG = PORTD  'Controller output port to RW LCD input
Define LCD_RWBIT = 2  'The number of the output controller to the input of RW LCD

Symbol warning_led = PORTA.1  'Assign the output to PORTA.1 warning_led name

TRISA = %00000001  'Configuring the PORTA (inputs/outputs)
ADCON1 = %00000010  'Install all the Porta pins as analog

Lcdinit 1  'Initialize the slider to the first line LCD
Lcddefchar 2, %0, %0, %0, %11100, %100, %11100, %10000, %11100  'Create a custom symbol to display on the LCD with ID 2
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'------ Fucking constants from mq135 library for arduino ------'
Const adc_value_max = 1024  'The maximum ADC value
Const operating_voltage = 5  'Sensor supply voltage
Const rl_board = 10  'kOm - The load resistor on the PCB of the sensor
Const r_zero = 76.63 'kOm - The resistance of the sensor in the open air
'Options for calculating CO2 ppm relative to the sensor resistance (calculated according to the graphs in the Datasheet)
Const a = -0.62
Const b = 1.92
'Scheme parameter
Dim pin_mq135 As Long  'Create a variable of analog pin sensor
Dim sensor_voltage As Single  'Creating a variable of the current voltage taken from the sensor
Dim sensor_resistance As Single  'Creating a variable of the current resistance of the sensor
Dim concentration_co2 As Single  'Create a variable of the current CO2 concentration
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

loop:
Adcin 0, pin_mq135  'Removed values from the analog port An0
sensor_voltage = pin_mq135 * (operating_voltage / adc_value_max)  'Calculation of voltage applied to pin An0
sensor_resistance = ((operating_voltage - sensor_voltage) / sensor_voltage) * rl_board  'The calculation of the sensor resistance

concentration_co2 = Exp((Log(sensor_resistance / r_zero) - b) / a)  'Calculation of CO2 concentration

Hserout "Concentration CO2: ", #concentration_co2, CrLf  'Sending values of concentrations in a hardware UART port
Serout PORTC.0, 9600, "Concentration CO2: ", #concentration_co2, CrLf  'Sending values of concentrations in a software UART port

Lcdout "   Conc. CO", 2, ": "  'The output of the first line on the LCD, here 2 - pre-created character
Lcdcmdout LcdLine2Home  'Initialize the slider to the second line LCD
Lcdout "   ", #concentration_co2, " ppm"

If concentration_co2 > 1000 Then  'Set the condition, according to statistics, the permissible concentration of CO2 in the air should not exceed 1000 ppm
warning_led = 1  'The power supply to the port with led
Hserout "ПРЕВЫШЕНИЕ ДОПУСТИМОЙ КОНЦЕНТРАЦИИ CO2!!!", CrLf  'Sending values of concentrations in a hardware UART port
Serout PORTC.0, 9600, "ПРЕВЫШЕНИЕ ДОПУСТИМОЙ КОНЦЕНТРАЦИИ CO2!!!", CrLf  'Sending values of concentrations in a software UART port
Else
warning_led = 0  'Выключение светодиода
Endif

loopend:

WaitMs 100
Lcdcmdout LcdClear  'Очистка LCD

Goto loop