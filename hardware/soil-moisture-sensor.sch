EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Capacitive Soil Moisture Sensor"
Date "2020-07-30"
Rev "1.0"
Comp ""
Comment1 "Philipp Oberdiek"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	8500 1300 8500 1400
Wire Wire Line
	8400 1300 8400 1400
Wire Wire Line
	8400 1300 8450 1300
Wire Wire Line
	8450 1200 8450 1300
Connection ~ 8450 1300
Wire Wire Line
	8450 1300 8500 1300
$Comp
L power:GND #PWR01
U 1 1 5F2337CD
P 8400 4400
F 0 "#PWR01" H 8400 4150 50  0001 C CNN
F 1 "GND" H 8405 4227 50  0000 C CNN
F 2 "" H 8400 4400 50  0001 C CNN
F 3 "" H 8400 4400 50  0001 C CNN
	1    8400 4400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 5F23EAF6
P 5550 4350
F 0 "SW1" H 5450 4650 50  0000 L CNN
F 1 "SW_Push" H 5450 4550 50  0000 L CNN
F 2 "MyFootprints:Button_2P_TS-1088-AR02016" H 5550 4550 50  0001 C CNN
F 3 "~" H 5550 4550 50  0001 C CNN
F 4 "C720477" H 5550 4350 50  0001 C CNN "LCSC"
	1    5550 4350
	-1   0    0    1   
$EndComp
NoConn ~ 9000 4100
NoConn ~ 9000 4000
NoConn ~ 9000 3900
NoConn ~ 9000 3800
NoConn ~ 9000 3600
NoConn ~ 9000 3100
NoConn ~ 9000 3000
NoConn ~ 9000 2800
NoConn ~ 9000 2700
NoConn ~ 9000 1700
NoConn ~ 7800 2000
NoConn ~ 7800 1900
$Comp
L Connector:Conn_01x06_Male J1
U 1 1 5F258B6A
P 1150 4900
F 0 "J1" H 1258 5281 50  0000 C CNN
F 1 "AVR ISP" H 1258 5190 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 1150 4900 50  0001 C CNN
F 3 "~" H 1150 4900 50  0001 C CNN
	1    1150 4900
	1    0    0    -1  
$EndComp
Text GLabel 1350 4700 2    50   Input ~ 0
MISO
Text GLabel 1350 4900 2    50   Input ~ 0
SCK
Text GLabel 1350 5000 2    50   Input ~ 0
MOSI
Text GLabel 1350 5100 2    50   Input ~ 0
RESET
$Comp
L power:GND #PWR09
U 1 1 5F25A2E7
P 1350 5200
F 0 "#PWR09" H 1350 4950 50  0001 C CNN
F 1 "GND" V 1355 5072 50  0000 R CNN
F 2 "" H 1350 5200 50  0001 C CNN
F 3 "" H 1350 5200 50  0001 C CNN
	1    1350 5200
	0    -1   -1   0   
$EndComp
Text GLabel 9000 3700 2    50   Input ~ 0
SENSOR-IN
Text GLabel 9000 2600 2    50   Input ~ 0
SENSOR-OUT
Text GLabel 1350 6700 0    50   Input ~ 0
SENSOR-IN
$Comp
L Device:R R1
U 1 1 5F25B37D
P 1650 6700
F 0 "R1" V 1450 6600 50  0000 L CNN
F 1 "10K" V 1550 6600 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1580 6700 50  0001 C CNN
F 3 "~" H 1650 6700 50  0001 C CNN
F 4 "C17414" V 1650 6700 50  0001 C CNN "LCSC"
	1    1650 6700
	0    1    1    0   
$EndComp
$Comp
L Device:D_Schottky D1
U 1 1 5F25C560
P 2500 6700
F 0 "D1" H 2500 6483 50  0000 C CNN
F 1 "D_Schottky" H 2500 6574 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 2500 6700 50  0001 C CNN
F 3 "~" H 2500 6700 50  0001 C CNN
F 4 "C154819" H 2500 6700 50  0001 C CNN "LCSC"
	1    2500 6700
	-1   0    0    1   
$EndComp
$Comp
L Device:C C2
U 1 1 5F25CCA2
P 2850 7050
F 0 "C2" H 2965 7096 50  0000 L CNN
F 1 "1uF" H 2965 7005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2888 6900 50  0001 C CNN
F 3 "~" H 2850 7050 50  0001 C CNN
F 4 "C28323" H 2850 7050 50  0001 C CNN "LCSC"
	1    2850 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5F25D2C0
P 3250 7050
F 0 "R2" H 3100 7000 50  0000 L CNN
F 1 "510K" H 3000 7100 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3180 7050 50  0001 C CNN
F 3 "~" H 3250 7050 50  0001 C CNN
F 4 "C17733" H 3250 7050 50  0001 C CNN "LCSC"
	1    3250 7050
	-1   0    0    1   
$EndComp
Text GLabel 3500 6700 2    50   Input ~ 0
SENSOR-OUT
Wire Wire Line
	1350 6700 1500 6700
$Comp
L power:GND #PWR06
U 1 1 5F25F3B3
P 2850 7300
F 0 "#PWR06" H 2850 7050 50  0001 C CNN
F 1 "GND" H 2855 7127 50  0000 C CNN
F 2 "" H 2850 7300 50  0001 C CNN
F 3 "" H 2850 7300 50  0001 C CNN
	1    2850 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 6700 2850 6700
Wire Wire Line
	2850 6900 2850 6700
Connection ~ 2850 6700
Wire Wire Line
	2850 6700 3250 6700
Wire Wire Line
	2850 7200 2850 7300
Wire Wire Line
	3250 7200 2850 7200
Connection ~ 2850 7200
Wire Wire Line
	3250 6900 3250 6700
Connection ~ 3250 6700
Wire Wire Line
	3250 6700 3500 6700
$Comp
L RF:NRF24L01_Breakout U2
U 1 1 5F27BC8B
P 1800 1750
F 0 "U2" H 2180 1796 50  0000 L CNN
F 1 "NRF24L01_Breakout" H 2180 1705 50  0000 L CNN
F 2 "mysensors_radios:NRF24L01-SMD" H 1950 2350 50  0001 L CIN
F 3 "http://www.nordicsemi.com/eng/content/download/2730/34105/file/nRF24L01_Product_Specification_v2_0.pdf" H 1800 1650 50  0001 C CNN
	1    1800 1750
	-1   0    0    1   
$EndComp
Text GLabel 2300 1550 2    50   Input ~ 0
CE
Text GLabel 2300 1750 2    50   Input ~ 0
CSN
Text GLabel 2300 1850 2    50   Input ~ 0
SCK
Text GLabel 2300 1950 2    50   Input ~ 0
MISO
Text GLabel 2300 2050 2    50   Input ~ 0
MOSI
$Comp
L power:GND #PWR04
U 1 1 5F27EC91
P 1800 1150
F 0 "#PWR04" H 1800 900 50  0001 C CNN
F 1 "GND" H 1805 977 50  0000 C CNN
F 2 "" H 1800 1150 50  0001 C CNN
F 3 "" H 1800 1150 50  0001 C CNN
	1    1800 1150
	-1   0    0    1   
$EndComp
NoConn ~ 2300 1450
Text GLabel 9000 1800 2    50   Input ~ 0
CE
Text GLabel 9000 1900 2    50   Input ~ 0
CSN
Text GLabel 9000 2000 2    50   Input ~ 0
MOSI
Text GLabel 9000 2100 2    50   Input ~ 0
MISO
Text GLabel 9000 2200 2    50   Input ~ 0
SCK
$Comp
L Device:CP C3
U 1 1 5F281125
P 2800 1800
F 0 "C3" H 2550 1750 50  0000 L CNN
F 1 "220uF" H 2450 1850 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x7.7" H 2838 1650 50  0001 C CNN
F 3 "~" H 2800 1800 50  0001 C CNN
F 4 "C127327" H 2800 1800 50  0001 C CNN "LCSC"
	1    2800 1800
	-1   0    0    1   
$EndComp
$Comp
L Device:C C4
U 1 1 5F281812
P 3300 1800
F 0 "C4" H 3415 1846 50  0000 L CNN
F 1 "1uF" H 3415 1755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3338 1650 50  0001 C CNN
F 3 "~" H 3300 1800 50  0001 C CNN
F 4 "C28323" H 3300 1800 50  0001 C CNN "LCSC"
	1    3300 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 1650 2800 1150
Wire Wire Line
	2800 1150 1800 1150
Connection ~ 1800 1150
Wire Wire Line
	2800 1950 2800 2350
Wire Wire Line
	2800 2350 1800 2350
Wire Wire Line
	2800 2350 3300 2350
Wire Wire Line
	3300 2350 3300 1950
Connection ~ 2800 2350
Wire Wire Line
	3300 1650 3300 1150
Wire Wire Line
	3300 1150 2800 1150
Connection ~ 2800 1150
$Comp
L Device:Battery_Cell BT1
U 1 1 5F29204B
P 5600 3350
F 0 "BT1" V 5850 3450 50  0000 L CNN
F 1 "Battery_Cell" V 5750 3150 50  0000 L CNN
F 2 "MyFootprints:BatteryHolder_Keystone_597_591_2AAA_3V" V 5600 3410 50  0001 C CNN
F 3 "~" V 5600 3410 50  0001 C CNN
	1    5600 3350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5F292E3B
P 5700 3350
F 0 "#PWR011" H 5700 3100 50  0001 C CNN
F 1 "GND" V 5705 3222 50  0000 R CNN
F 2 "" H 5700 3350 50  0001 C CNN
F 3 "" H 5700 3350 50  0001 C CNN
	1    5700 3350
	0    -1   -1   0   
$EndComp
Text GLabel 9000 3200 2    50   Input ~ 0
RESET
Text GLabel 5350 3900 0    50   Input ~ 0
RESET
$Comp
L Device:R R3
U 1 1 5F293AB3
P 5500 3900
F 0 "R3" V 5300 3800 50  0000 L CNN
F 1 "10K" V 5400 3800 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5430 3900 50  0001 C CNN
F 3 "~" H 5500 3900 50  0001 C CNN
F 4 "C17414" V 5500 3900 50  0001 C CNN "LCSC"
	1    5500 3900
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5F295CC4
P 5750 4350
F 0 "#PWR012" H 5750 4100 50  0001 C CNN
F 1 "GND" H 5755 4177 50  0000 C CNN
F 2 "" H 5750 4350 50  0001 C CNN
F 3 "" H 5750 4350 50  0001 C CNN
	1    5750 4350
	0    -1   -1   0   
$EndComp
Text GLabel 5350 4350 0    50   Input ~ 0
RESET
NoConn ~ 7800 1700
Wire Wire Line
	1800 6700 2100 6700
$Comp
L Connector:Conn_01x06_Male J2
U 1 1 5F2DA813
P 1150 4000
F 0 "J2" H 1258 4381 50  0000 C CNN
F 1 "FTDI" H 1258 4290 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 1150 4000 50  0001 C CNN
F 3 "~" H 1150 4000 50  0001 C CNN
	1    1150 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5F2DBED4
P 1350 3800
F 0 "#PWR03" H 1350 3550 50  0001 C CNN
F 1 "GND" V 1355 3672 50  0000 R CNN
F 2 "" H 1350 3800 50  0001 C CNN
F 3 "" H 1350 3800 50  0001 C CNN
	1    1350 3800
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5F2DC487
P 1350 3900
F 0 "#PWR013" H 1350 3650 50  0001 C CNN
F 1 "GND" V 1355 3772 50  0000 R CNN
F 2 "" H 1350 3900 50  0001 C CNN
F 3 "" H 1350 3900 50  0001 C CNN
	1    1350 3900
	0    -1   -1   0   
$EndComp
Text GLabel 1350 4100 2    50   Input ~ 0
RX
Text GLabel 1350 4200 2    50   Input ~ 0
TX
$Comp
L MCU_Microchip_ATmega:ATmega328P-AU U1
U 1 1 5F22DC2F
P 8400 2900
F 0 "U1" H 8050 2100 50  0000 C CNN
F 1 "ATmega328P-AU" H 8300 2000 50  0000 C CNN
F 2 "Package_QFP:TQFP-32_7x7mm_P0.8mm" H 8400 2900 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 8400 2900 50  0001 C CNN
F 4 "C14877" H 8400 2900 50  0001 C CNN "LCSC"
	1    8400 2900
	1    0    0    -1  
$EndComp
Text GLabel 9000 3400 2    50   Input ~ 0
RX
Text GLabel 9000 3500 2    50   Input ~ 0
TX
Text GLabel 2150 4300 2    50   Input ~ 0
RESET
Wire Wire Line
	2100 7250 2100 6700
Connection ~ 2100 6700
Wire Wire Line
	2100 6700 2350 6700
$Comp
L Connector_Generic:Conn_01x01 Sensor1
U 1 1 5F2E2B27
P 2100 7450
F 0 "Sensor1" V 2018 7530 50  0000 L CNN
F 1 "Conn_01x01" H 2180 7401 50  0001 L CNN
F 2 "MyFootprints:Capacitive_Soil_Moisture_Sensor" H 2100 7450 50  0001 C CNN
F 3 "~" H 2100 7450 50  0001 C CNN
	1    2100 7450
	0    1    1    0   
$EndComp
Text Label 2100 7250 1    50   ~ 0
Sensor_Track
$Comp
L mysensors_security:ATSHA204A U3
U 1 1 5F3AB0AC
P 10650 2900
F 0 "U3" H 10680 2938 40  0000 L CNN
F 1 "ATSHA204A" H 10680 2862 40  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 10400 2900 30  0001 C CIN
F 3 "http://www.atmel.com/Images/Atmel-8885-CryptoAuth-ATSHA204A-Datasheet.pdf" H 10680 2824 60  0001 L CNN
F 4 "C34377" H 10650 2900 50  0001 C CNN "LCSC"
	1    10650 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5F3ABE68
P 10450 3250
F 0 "#PWR016" H 10450 3000 50  0001 C CNN
F 1 "GND" H 10455 3077 50  0000 C CNN
F 2 "" H 10450 3250 50  0001 C CNN
F 3 "" H 10450 3250 50  0001 C CNN
	1    10450 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 2900 10000 2900
$Comp
L power:+BATT #PWR017
U 1 1 5F40B3AC
P 5400 3350
F 0 "#PWR017" H 5400 3200 50  0001 C CNN
F 1 "+BATT" V 5415 3477 50  0000 L CNN
F 2 "" H 5400 3350 50  0001 C CNN
F 3 "" H 5400 3350 50  0001 C CNN
	1    5400 3350
	0    -1   -1   0   
$EndComp
$Comp
L power:+BATT #PWR08
U 1 1 5F528061
P 5650 3900
F 0 "#PWR08" H 5650 3750 50  0001 C CNN
F 1 "+BATT" V 5665 4027 50  0000 L CNN
F 2 "" H 5650 3900 50  0001 C CNN
F 3 "" H 5650 3900 50  0001 C CNN
	1    5650 3900
	0    1    1    0   
$EndComp
$Comp
L power:+BATT #PWR07
U 1 1 5F52866E
P 1350 4800
F 0 "#PWR07" H 1350 4650 50  0001 C CNN
F 1 "+BATT" V 1365 4927 50  0000 L CNN
F 2 "" H 1350 4800 50  0001 C CNN
F 3 "" H 1350 4800 50  0001 C CNN
	1    1350 4800
	0    1    1    0   
$EndComp
$Comp
L power:+BATT #PWR05
U 1 1 5F528D4C
P 1350 4000
F 0 "#PWR05" H 1350 3850 50  0001 C CNN
F 1 "+BATT" V 1365 4127 50  0000 L CNN
F 2 "" H 1350 4000 50  0001 C CNN
F 3 "" H 1350 4000 50  0001 C CNN
	1    1350 4000
	0    1    1    0   
$EndComp
$Comp
L power:+BATT #PWR010
U 1 1 5F5291F8
P 8450 1200
F 0 "#PWR010" H 8450 1050 50  0001 C CNN
F 1 "+BATT" V 8465 1327 50  0000 L CNN
F 2 "" H 8450 1200 50  0001 C CNN
F 3 "" H 8450 1200 50  0001 C CNN
	1    8450 1200
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR014
U 1 1 5F5297AE
P 10450 2300
F 0 "#PWR014" H 10450 2150 50  0001 C CNN
F 1 "+BATT" V 10465 2427 50  0000 L CNN
F 2 "" H 10450 2300 50  0001 C CNN
F 3 "" H 10450 2300 50  0001 C CNN
	1    10450 2300
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR02
U 1 1 5F529BB0
P 1800 2350
F 0 "#PWR02" H 1800 2200 50  0001 C CNN
F 1 "+BATT" V 1815 2477 50  0000 L CNN
F 2 "" H 1800 2350 50  0001 C CNN
F 3 "" H 1800 2350 50  0001 C CNN
	1    1800 2350
	-1   0    0    1   
$EndComp
Connection ~ 1800 2350
$Comp
L Device:R R4
U 1 1 5F57BF06
P 10000 2600
F 0 "R4" V 9800 2500 50  0000 L CNN
F 1 "10K" V 9900 2500 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9930 2600 50  0001 C CNN
F 3 "~" H 10000 2600 50  0001 C CNN
F 4 "C17514" V 10000 2600 50  0001 C CNN "LCSC"
	1    10000 2600
	-1   0    0    1   
$EndComp
Wire Wire Line
	10000 2750 10000 2900
Connection ~ 10000 2900
Wire Wire Line
	10000 2900 10100 2900
Wire Wire Line
	10450 2300 10450 2400
Wire Wire Line
	10000 2450 10000 2400
Wire Wire Line
	10000 2400 10450 2400
Connection ~ 10450 2400
Wire Wire Line
	10450 2400 10450 2550
$Comp
L Device:Resonator Y1
U 1 1 5F6F9E89
P 9650 2050
F 0 "Y1" H 9650 2205 50  0000 C CNN
F 1 "Resonator" H 9650 2296 50  0000 C CNN
F 2 "MyFootprints:ceramik_resonator_murata_CSTCE8M00G52-R0" H 9625 2050 50  0001 C CNN
F 3 "~" H 9625 2050 50  0001 C CNN
F 4 "C907975" H 9650 2050 50  0001 C CNN "LCSC"
	1    9650 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	9500 2050 9400 2050
Wire Wire Line
	9400 2050 9400 2300
Wire Wire Line
	9400 2300 9000 2300
Wire Wire Line
	9000 2400 9900 2400
Wire Wire Line
	9900 2400 9900 2050
Wire Wire Line
	9900 2050 9800 2050
$Comp
L power:GND #PWR015
U 1 1 5F6FD6B1
P 9650 1850
F 0 "#PWR015" H 9650 1600 50  0001 C CNN
F 1 "GND" H 9655 1677 50  0000 C CNN
F 2 "" H 9650 1850 50  0001 C CNN
F 3 "" H 9650 1850 50  0001 C CNN
	1    9650 1850
	-1   0    0    1   
$EndComp
$Comp
L Device:C C1
U 1 1 5FC124D0
P 1750 4300
F 0 "C1" V 1600 4250 50  0000 L CNN
F 1 "100nF" V 1900 4200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1788 4150 50  0001 C CNN
F 3 "~" H 1750 4300 50  0001 C CNN
F 4 "C49678" V 1750 4300 50  0001 C CNN "LCSC"
	1    1750 4300
	0    1    1    0   
$EndComp
Wire Wire Line
	2150 4300 1900 4300
Wire Wire Line
	1600 4300 1350 4300
Text Notes 1500 850  0    79   ~ 0
Radio Communication
Text Notes 1950 6350 0    79   ~ 0
Capacitive Sensor
Text Notes 1150 3450 0    79   ~ 0
Pin Headers
Text Notes 8650 850  0    79   ~ 0
Controller
Text Notes 5050 2900 0    79   ~ 0
Power and Reset
$EndSCHEMATC
