EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_01x06 J204
U 1 1 60AC68C0
P 5850 3950
F 0 "J204" H 5930 3942 50  0000 L CNN
F 1 "MCP4725_1" H 5930 3851 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x06_P2.54mm_Vertical" H 5850 3950 50  0001 C CNN
F 3 "~" H 5850 3950 50  0001 C CNN
	1    5850 3950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J205
U 1 1 60AC79C1
P 5850 5200
F 0 "J205" H 5930 5192 50  0000 L CNN
F 1 "MCP4724_2" H 5930 5101 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x06_P2.54mm_Vertical" H 5850 5200 50  0001 C CNN
F 3 "~" H 5850 5200 50  0001 C CNN
	1    5850 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R202
U 1 1 60AD4351
P 8150 2100
F 0 "R202" V 8100 2100 50  0000 C CNN
F 1 "220" V 8200 2100 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 8190 2090 50  0001 C CNN
F 3 "~" H 8150 2100 50  0001 C CNN
	1    8150 2100
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R201
U 1 1 60AD57EE
P 7850 2000
F 0 "R201" V 7800 2000 50  0000 C CNN
F 1 "220" V 7900 2000 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 7890 1990 50  0001 C CNN
F 3 "~" H 7850 2000 50  0001 C CNN
	1    7850 2000
	0    1    1    0   
$EndComp
Text Label 5300 2200 0    50   ~ 0
SCL
Text Label 5300 2100 0    50   ~ 0
SDA
Wire Wire Line
	5300 2100 5600 2100
Wire Wire Line
	5600 2200 5300 2200
$Comp
L power:GND #PWR0209
U 1 1 60AD9405
P 7850 2500
F 0 "#PWR0209" H 7850 2250 50  0001 C CNN
F 1 "GND" H 7855 2327 50  0000 C CNN
F 2 "" H 7850 2500 50  0001 C CNN
F 3 "" H 7850 2500 50  0001 C CNN
	1    7850 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 2100 8000 2100
Wire Wire Line
	9050 2600 8800 2600
$Comp
L power:GND #PWR0210
U 1 1 60ADD9E9
P 8800 2600
F 0 "#PWR0210" H 8800 2350 50  0001 C CNN
F 1 "GND" H 8805 2427 50  0000 C CNN
F 2 "" H 8800 2600 50  0001 C CNN
F 3 "" H 8800 2600 50  0001 C CNN
	1    8800 2600
	1    0    0    -1  
$EndComp
Connection ~ 8800 2600
Wire Wire Line
	8800 2600 8500 2600
$Comp
L power:+5V #PWR0201
U 1 1 60ADECA5
P 4500 2500
F 0 "#PWR0201" H 4500 2350 50  0001 C CNN
F 1 "+5V" H 4515 2673 50  0000 C CNN
F 2 "" H 4500 2500 50  0001 C CNN
F 3 "" H 4500 2500 50  0001 C CNN
	1    4500 2500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0205
U 1 1 60AE1D83
P 5350 3750
F 0 "#PWR0205" H 5350 3600 50  0001 C CNN
F 1 "+5V" H 5365 3923 50  0000 C CNN
F 2 "" H 5350 3750 50  0001 C CNN
F 3 "" H 5350 3750 50  0001 C CNN
	1    5350 3750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0206
U 1 1 60AE22C6
P 5400 5000
F 0 "#PWR0206" H 5400 4850 50  0001 C CNN
F 1 "+5V" H 5415 5173 50  0000 C CNN
F 2 "" H 5400 5000 50  0001 C CNN
F 3 "" H 5400 5000 50  0001 C CNN
	1    5400 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3750 5350 3750
Wire Wire Line
	5650 5000 5550 5000
Wire Wire Line
	5650 5400 5550 5400
Wire Wire Line
	5550 5400 5550 5000
Connection ~ 5550 5000
Wire Wire Line
	5550 5000 5400 5000
$Comp
L power:GND #PWR0203
U 1 1 60AE3A57
P 4950 4050
F 0 "#PWR0203" H 4950 3800 50  0001 C CNN
F 1 "GND" V 4955 3922 50  0000 R CNN
F 2 "" H 4950 4050 50  0001 C CNN
F 3 "" H 4950 4050 50  0001 C CNN
	1    4950 4050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0204
U 1 1 60AE41CF
P 5150 5100
F 0 "#PWR0204" H 5150 4850 50  0001 C CNN
F 1 "GND" H 5155 4927 50  0000 C CNN
F 2 "" H 5150 5100 50  0001 C CNN
F 3 "" H 5150 5100 50  0001 C CNN
	1    5150 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 5100 5150 5100
Wire Wire Line
	5650 3850 5150 3850
Text Label 5400 3950 0    50   ~ 0
SCL
Text Label 5400 5200 0    50   ~ 0
SCL
Text Label 5400 4050 0    50   ~ 0
SDA
Text Label 5400 5300 0    50   ~ 0
SDA
Wire Wire Line
	5650 3950 5400 3950
Wire Wire Line
	5650 4050 5400 4050
Wire Wire Line
	5650 5300 5400 5300
Wire Wire Line
	5650 5200 5400 5200
Wire Wire Line
	9050 2000 9050 2100
Wire Wire Line
	9050 2000 9250 2000
Text Label 7500 1600 0    50   ~ 0
D10
Text Label 7500 1700 0    50   ~ 0
D9
Text Label 7500 1800 0    50   ~ 0
BKA
Text Label 7500 1900 0    50   ~ 0
TLA
Wire Wire Line
	7350 1600 7500 1600
Wire Wire Line
	7350 1700 7500 1700
Text Label 7500 2400 0    50   ~ 0
PANIC
Wire Wire Line
	7500 2400 7350 2400
$Comp
L Device:CP1 C203
U 1 1 60AF3E36
P 8500 2350
F 0 "C203" H 8615 2396 50  0000 L CNN
F 1 "330uF" H 8615 2305 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 8500 2350 50  0001 C CNN
F 3 "~" H 8500 2350 50  0001 C CNN
	1    8500 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C204
U 1 1 60AF4F48
P 9050 2250
F 0 "C204" H 9165 2296 50  0000 L CNN
F 1 "330uF" H 9165 2205 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 9050 2250 50  0001 C CNN
F 3 "~" H 9050 2250 50  0001 C CNN
	1    9050 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C201
U 1 1 60AF531B
P 4800 2650
F 0 "C201" H 4600 2700 50  0000 L CNN
F 1 "0.1uF" H 4500 2600 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.2mm_W2.5mm_P5.00mm_FKS2_FKP2_MKS2_MKP2" H 4800 2650 50  0001 C CNN
F 3 "~" H 4800 2650 50  0001 C CNN
	1    4800 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C202
U 1 1 60AF56B8
P 5100 2650
F 0 "C202" H 5215 2696 50  0000 L CNN
F 1 "10uF" H 5215 2605 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 5100 2650 50  0001 C CNN
F 3 "~" H 5100 2650 50  0001 C CNN
	1    5100 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 2100 8500 2100
Wire Wire Line
	8500 2100 8500 2200
Wire Wire Line
	8500 2100 8650 2100
Connection ~ 8500 2100
Wire Wire Line
	4500 2500 4800 2500
Connection ~ 4800 2500
Wire Wire Line
	4800 2500 5100 2500
Connection ~ 5100 2500
Wire Wire Line
	5100 2500 5600 2500
Wire Wire Line
	4800 2800 4950 2800
$Comp
L power:GND #PWR0202
U 1 1 60AFD434
P 4950 2800
F 0 "#PWR0202" H 4950 2550 50  0001 C CNN
F 1 "GND" H 4955 2627 50  0000 C CNN
F 2 "" H 4950 2800 50  0001 C CNN
F 3 "" H 4950 2800 50  0001 C CNN
	1    4950 2800
	1    0    0    -1  
$EndComp
Connection ~ 4950 2800
Wire Wire Line
	4950 2800 5100 2800
Wire Wire Line
	8500 2500 8500 2600
Wire Wire Line
	9050 2600 9050 2400
Text Label 5300 1700 0    50   ~ 0
A0
$Comp
L Nano-Board-REV2-rescue:NANO_LFT-Connector_Generic J203
U 1 1 60C0C207
P 5800 2050
F 0 "J203" H 5750 2900 50  0000 L CNN
F 1 "NANO_LFT" H 5650 2800 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x15_P2.54mm_Vertical" H 5800 2050 50  0001 C CNN
F 3 "" H 5800 2050 50  0001 C CNN
	1    5800 2050
	1    0    0    -1  
$EndComp
$Comp
L Nano-Board-REV2-rescue:NANO_RT-Connector_Generic J206
U 1 1 60C0D097
P 7150 2050
F 0 "J206" H 7182 2925 50  0000 C CNN
F 1 "NANO_RT" H 7182 2834 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x15_P2.54mm_Vertical" H 7200 2050 50  0001 C CNN
F 3 "" H 7200 2050 50  0001 C CNN
	1    7150 2050
	1    0    0    -1  
$EndComp
$Comp
L Nano-Board-REV2-rescue:Conn_01x15-Connector_Generic J201
U 1 1 60C14A71
P 1850 4650
F 0 "J201" H 1800 5550 50  0000 L CNN
F 1 "Conn_01x15" H 1650 5450 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x15_P2.54mm_Vertical" H 1850 4650 50  0001 C CNN
F 3 "~" H 1850 4650 50  0001 C CNN
	1    1850 4650
	-1   0    0    -1  
$EndComp
$Comp
L Nano-Board-REV2-rescue:Conn_01x15-Connector_Generic J202
U 1 1 60C15CDF
P 3750 4650
F 0 "J202" H 3700 5550 50  0000 L CNN
F 1 "Conn_01x15" H 3550 5450 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x15_P2.54mm_Vertical" H 3750 4650 50  0001 C CNN
F 3 "~" H 3750 4650 50  0001 C CNN
	1    3750 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4150 5150 4150
Wire Wire Line
	5150 4150 5150 4050
Wire Wire Line
	5150 4050 4950 4050
Connection ~ 5150 4050
Wire Wire Line
	5150 4050 5150 3850
Text Label 5300 1400 0    50   ~ 0
D13
Text Label 5300 1500 0    50   ~ 0
3V3
Text Label 5300 1600 0    50   ~ 0
REF
Text Label 5300 1800 0    50   ~ 0
A1
Text Label 5300 1900 0    50   ~ 0
A2
Text Label 5300 2000 0    50   ~ 0
A3
Text Label 5300 2300 0    50   ~ 0
A6
Text Label 5300 2400 0    50   ~ 0
A7
Text Label 5450 2800 0    50   ~ 0
Vin
Wire Wire Line
	5100 2800 5400 2800
Wire Wire Line
	5400 2800 5400 2700
Wire Wire Line
	5400 2700 5600 2700
Connection ~ 5100 2800
Text Label 7500 1400 0    50   ~ 0
D12
Text Label 7500 1500 0    50   ~ 0
D11
Text Label 7500 2200 0    50   ~ 0
D4
Text Label 7500 2300 0    50   ~ 0
D3
Text Label 7500 2600 0    50   ~ 0
RST_2
Text Label 7500 2700 0    50   ~ 0
Rx0
Text Label 7500 2800 0    50   ~ 0
Tx1
Wire Wire Line
	7500 2600 7350 2600
Wire Wire Line
	7350 2700 7500 2700
Wire Wire Line
	7500 2800 7350 2800
Wire Wire Line
	7500 2200 7350 2200
Wire Wire Line
	7350 2300 7500 2300
Wire Wire Line
	7500 1500 7350 1500
Wire Wire Line
	7350 1400 7500 1400
Wire Wire Line
	5600 1400 5300 1400
Wire Wire Line
	5300 1500 5600 1500
Wire Wire Line
	5600 1600 5300 1600
Wire Wire Line
	5300 1800 5600 1800
Wire Wire Line
	5600 1900 5300 1900
Wire Wire Line
	5300 2000 5600 2000
Wire Wire Line
	5300 2300 5600 2300
Wire Wire Line
	5300 2400 5600 2400
Wire Wire Line
	5450 2800 5600 2800
Text Label 2400 3950 0    50   ~ 0
D13
Text Label 2400 4050 0    50   ~ 0
3V3
Text Label 2400 4150 0    50   ~ 0
REF
Text Label 2400 4250 0    50   ~ 0
A0
Text Label 2400 4350 0    50   ~ 0
A1
Wire Wire Line
	2050 3950 2400 3950
Wire Wire Line
	2050 4050 2400 4050
Wire Wire Line
	2050 4150 2400 4150
Wire Wire Line
	2050 4250 2400 4250
Wire Wire Line
	2050 4350 2400 4350
Text Label 2400 4450 0    50   ~ 0
A2
Text Label 2400 4550 0    50   ~ 0
A3
Text Label 2400 4650 0    50   ~ 0
SDA
Text Label 2400 4750 0    50   ~ 0
SCL
Text Label 2400 4850 0    50   ~ 0
A6
Text Label 2400 4950 0    50   ~ 0
A7
Text Label 5350 2600 0    50   ~ 0
RST_1
Text Label 5300 2500 0    50   ~ 0
5V
Text Label 5450 2700 0    50   ~ 0
GND
Text Label 2400 5050 0    50   ~ 0
5V
Text Label 2400 5150 0    50   ~ 0
RST_1
Text Label 2400 5250 0    50   ~ 0
GND
Text Label 2400 5350 0    50   ~ 0
Vin
Wire Wire Line
	2050 4450 2400 4450
Wire Wire Line
	2050 4550 2400 4550
Wire Wire Line
	2050 4650 2400 4650
Wire Wire Line
	2050 4750 2400 4750
Wire Wire Line
	2050 4850 2400 4850
Wire Wire Line
	2050 4950 2400 4950
Wire Wire Line
	2050 5050 2400 5050
Wire Wire Line
	2050 5150 2400 5150
Wire Wire Line
	2050 5250 2400 5250
Wire Wire Line
	2050 5350 2400 5350
Text Label 3150 3950 0    50   ~ 0
D12
Text Label 3150 4050 0    50   ~ 0
D11
Text Label 3150 4350 0    50   ~ 0
BKA
Text Label 3150 4450 0    50   ~ 0
TLA
Text Label 7500 2000 0    50   ~ 0
D6
Text Label 7500 2100 0    50   ~ 0
D5
Text Label 3150 4550 0    50   ~ 0
D6
Text Label 3150 4650 0    50   ~ 0
D5
Text Label 3150 4750 0    50   ~ 0
D4
Text Label 3150 4850 0    50   ~ 0
D3
Text Label 3150 4950 0    50   ~ 0
PANIC
Text Label 3150 5050 0    50   ~ 0
GND
Text Label 7500 2500 0    50   ~ 0
GND
Text Label 3150 5150 0    50   ~ 0
RST_2
Text Label 3150 5250 0    50   ~ 0
Rx0
Text Label 3150 5350 0    50   ~ 0
Tx1
Wire Wire Line
	3550 3950 3150 3950
Wire Wire Line
	3150 4050 3550 4050
Wire Wire Line
	3150 4150 3550 4150
Wire Wire Line
	3150 4250 3550 4250
Wire Wire Line
	3150 4350 3550 4350
Wire Wire Line
	3150 4450 3550 4450
Wire Wire Line
	3150 4550 3550 4550
Wire Wire Line
	3150 4650 3550 4650
Wire Wire Line
	3150 4750 3550 4750
Wire Wire Line
	3150 4850 3550 4850
Wire Wire Line
	3150 4950 3550 4950
Wire Wire Line
	3150 5050 3550 5050
Wire Wire Line
	3150 5250 3550 5250
Wire Wire Line
	3150 5350 3550 5350
Wire Wire Line
	3150 5150 3550 5150
Wire Wire Line
	5350 2600 5600 2600
Wire Wire Line
	7350 2500 7850 2500
Wire Wire Line
	7350 2000 7700 2000
Wire Wire Line
	8000 2000 9050 2000
Connection ~ 9050 2000
Text Label 3150 4150 0    50   ~ 0
D10
Text Label 3150 4250 0    50   ~ 0
D9
Text GLabel 6900 4650 0    50   Output ~ 0
GND
$Comp
L power:GND #PWR0208
U 1 1 617AA68A
P 7300 4700
F 0 "#PWR0208" H 7300 4450 50  0001 C CNN
F 1 "GND" H 7305 4527 50  0000 C CNN
F 2 "" H 7300 4700 50  0001 C CNN
F 3 "" H 7300 4700 50  0001 C CNN
	1    7300 4700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0207
U 1 1 617AABBC
P 7300 4400
F 0 "#PWR0207" H 7300 4250 50  0001 C CNN
F 1 "+5V" H 7315 4573 50  0000 C CNN
F 2 "" H 7300 4400 50  0001 C CNN
F 3 "" H 7300 4400 50  0001 C CNN
	1    7300 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 4650 7300 4650
Wire Wire Line
	7300 4650 7300 4700
Wire Wire Line
	5000 5500 5650 5500
Wire Wire Line
	5100 4250 5650 4250
Wire Wire Line
	5050 1700 5600 1700
Wire Wire Line
	7350 1800 8150 1800
Wire Wire Line
	7350 1900 8150 1900
Text HLabel 5050 1700 0    50   Input ~ 0
A0
Text HLabel 8150 1800 2    50   Input ~ 0
BKA
Text HLabel 8150 1900 2    50   Input ~ 0
TLA
Text HLabel 9250 2000 2    50   Input ~ 0
BRK_SIG
Text HLabel 8650 2100 2    50   Input ~ 0
TTL_SIG
Text HLabel 5000 5500 0    50   Input ~ 0
STR_LFT
Text HLabel 5100 4250 0    50   Input ~ 0
STR_RT
Text GLabel 6900 4400 0    50   Output ~ 0
+5V
Wire Wire Line
	6900 4400 7300 4400
$EndSCHEMATC
