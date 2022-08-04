EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
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
L Connector:8P8C J301
U 1 1 60C5003C
P 1900 1250
F 0 "J301" H 1570 1254 50  0000 R CNN
F 1 "Throttle" H 1570 1345 50  0000 R CNN
F 2 "JACart Parts:TE_1-406525-1" V 1900 1275 50  0001 C CNN
F 3 "~" V 1900 1275 50  0001 C CNN
	1    1900 1250
	1    0    0    1   
$EndComp
$Comp
L Connector:8P8C J302
U 1 1 60C50803
P 1900 2250
F 0 "J302" H 1570 2254 50  0000 R CNN
F 1 "Brake" H 1570 2345 50  0000 R CNN
F 2 "JACart Parts:TE_1-406525-1" V 1900 2275 50  0001 C CNN
F 3 "~" V 1900 2275 50  0001 C CNN
	1    1900 2250
	1    0    0    1   
$EndComp
$Comp
L Connector:8P8C J303
U 1 1 60C511E8
P 1900 3300
F 0 "J303" H 1571 3304 50  0000 R CNN
F 1 "Steering" H 1571 3395 50  0000 R CNN
F 2 "JACart Parts:TE_1-406525-1" V 1900 3325 50  0001 C CNN
F 3 "~" V 1900 3325 50  0001 C CNN
	1    1900 3300
	1    0    0    1   
$EndComp
NoConn ~ 2300 950 
NoConn ~ 2300 1350
NoConn ~ 2300 1950
NoConn ~ 2300 2350
NoConn ~ 2300 3300
NoConn ~ 2300 3400
NoConn ~ 2300 3500
$Comp
L Regulator_Linear:L7805 U301
U 1 1 60C56C72
P 5200 3400
F 0 "U301" H 5200 3642 50  0000 C CNN
F 1 "L7805" H 5200 3551 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 5225 3250 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 5200 3350 50  0001 C CNN
	1    5200 3400
	1    0    0    -1  
$EndComp
Text Label 2500 1050 0    50   ~ 0
B5-2
$Comp
L power:GND #PWR0306
U 1 1 60C5D58A
P 2900 1150
F 0 "#PWR0306" H 2900 900 50  0001 C CNN
F 1 "GND" V 2905 1022 50  0000 R CNN
F 2 "" H 2900 1150 50  0001 C CNN
F 3 "" H 2900 1150 50  0001 C CNN
	1    2900 1150
	0    -1   -1   0   
$EndComp
Text Label 2500 1250 0    50   ~ 0
B5-4
Text Label 2500 1450 0    50   ~ 0
B5-6
Text Label 2500 1550 0    50   ~ 0
B5-7
Text Label 2500 1650 0    50   ~ 0
B5-8
Wire Wire Line
	2300 1050 2500 1050
Wire Wire Line
	2300 1150 2900 1150
Wire Wire Line
	2300 1250 2500 1250
Wire Wire Line
	2300 1450 2500 1450
Wire Wire Line
	2300 1550 2500 1550
Wire Wire Line
	2300 1650 2500 1650
Text Label 2500 2050 0    50   ~ 0
B4-2
Text Label 2500 2250 0    50   ~ 0
B4-4
Text Label 2500 2450 0    50   ~ 0
B4-6
Text Label 2500 2550 0    50   ~ 0
B4-7
Text Label 2500 2650 0    50   ~ 0
B4-8
$Comp
L power:GND #PWR0307
U 1 1 60C6177E
P 2900 2150
F 0 "#PWR0307" H 2900 1900 50  0001 C CNN
F 1 "GND" V 2905 2022 50  0000 R CNN
F 2 "" H 2900 2150 50  0001 C CNN
F 3 "" H 2900 2150 50  0001 C CNN
	1    2900 2150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2300 2050 2500 2050
Wire Wire Line
	2300 2150 2900 2150
Wire Wire Line
	2300 2250 2500 2250
Wire Wire Line
	2300 2450 2500 2450
Wire Wire Line
	2300 2550 2500 2550
Wire Wire Line
	2300 2650 2500 2650
$Comp
L power:GND #PWR0309
U 1 1 60C655AB
P 2950 3200
F 0 "#PWR0309" H 2950 2950 50  0001 C CNN
F 1 "GND" V 2955 3072 50  0000 R CNN
F 2 "" H 2950 3200 50  0001 C CNN
F 3 "" H 2950 3200 50  0001 C CNN
	1    2950 3200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2300 3000 2500 3000
Wire Wire Line
	2300 3100 2950 3100
Wire Wire Line
	2300 3200 2950 3200
Wire Wire Line
	2300 3600 2500 3600
Wire Wire Line
	2300 3700 2500 3700
$Comp
L power:GND #PWR0311
U 1 1 60C69100
P 5200 3700
F 0 "#PWR0311" H 5200 3450 50  0001 C CNN
F 1 "GND" H 5205 3527 50  0000 C CNN
F 2 "" H 5200 3700 50  0001 C CNN
F 3 "" H 5200 3700 50  0001 C CNN
	1    5200 3700
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0310
U 1 1 60C784E2
P 4700 3400
F 0 "#PWR0310" H 4700 3250 50  0001 C CNN
F 1 "+12V" H 4715 3573 50  0000 C CNN
F 2 "" H 4700 3400 50  0001 C CNN
F 3 "" H 4700 3400 50  0001 C CNN
	1    4700 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 3400 4900 3400
Wire Wire Line
	5500 3400 5700 3400
$Comp
L Connector:Screw_Terminal_01x02 J305
U 1 1 60C7B8C1
P 2450 5200
F 0 "J305" H 2530 5192 50  0000 L CNN
F 1 "Vbattery" H 2530 5101 50  0000 L CNN
F 2 "JACart Parts:TE_282837-2" H 2450 5200 50  0001 C CNN
F 3 "~" H 2450 5200 50  0001 C CNN
	1    2450 5200
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0304
U 1 1 60C7C4CD
P 2050 5200
F 0 "#PWR0304" H 2050 5050 50  0001 C CNN
F 1 "+12V" H 2065 5373 50  0000 C CNN
F 2 "" H 2050 5200 50  0001 C CNN
F 3 "" H 2050 5200 50  0001 C CNN
	1    2050 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0305
U 1 1 60C7CABC
P 2050 5300
F 0 "#PWR0305" H 2050 5050 50  0001 C CNN
F 1 "GND" H 2055 5127 50  0000 C CNN
F 2 "" H 2050 5300 50  0001 C CNN
F 3 "" H 2050 5300 50  0001 C CNN
	1    2050 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 5200 2250 5200
Wire Wire Line
	2050 5300 2250 5300
Text Label 4700 1100 0    50   ~ 0
B4-4
Text Label 4700 1200 0    50   ~ 0
B4-6
Text Label 4700 1400 0    50   ~ 0
B4-2
Text Label 4700 1500 0    50   ~ 0
B4-8
Text Label 4700 1600 0    50   ~ 0
R2-R6
Text Label 4700 2800 0    50   ~ 0
R2-R6
Text Label 4700 1700 0    50   ~ 0
B5-4
Text Label 4700 1800 0    50   ~ 0
B5-6
Text Label 4700 2000 0    50   ~ 0
B5-2
Text Label 4700 2100 0    50   ~ 0
B5-8
Text Label 4700 2200 0    50   ~ 0
R4-R5
Text Label 4700 2500 0    50   ~ 0
R4-R5
NoConn ~ 5050 2300
Text Label 4700 2400 0    50   ~ 0
B5-7
NoConn ~ 5050 2600
Text Label 4700 2700 0    50   ~ 0
B4-7
$Comp
L Connector:Screw_Terminal_01x02 J306
U 1 1 60CFFF4E
P 2450 5850
F 0 "J306" H 2530 5842 50  0000 L CNN
F 1 "Master Switch" H 2530 5751 50  0000 L CNN
F 2 "JACart Parts:TE_282837-2" H 2450 5850 50  0001 C CNN
F 3 "~" H 2450 5850 50  0001 C CNN
	1    2450 5850
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Heatsink HS301
U 1 1 60D1FBA7
P 5200 4250
F 0 "HS301" H 5342 4371 50  0000 L CNN
F 1 "Heatsink" H 5342 4280 50  0000 L CNN
F 2 "JACart Parts:HSINK_6398BG" H 5212 4250 50  0001 C CNN
F 3 "~" H 5212 4250 50  0001 C CNN
	1    5200 4250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0308
U 1 1 60D31B62
P 2950 3100
F 0 "#PWR0308" H 2950 2950 50  0001 C CNN
F 1 "VCC" H 2965 3273 50  0000 C CNN
F 2 "" H 2950 3100 50  0001 C CNN
F 3 "" H 2950 3100 50  0001 C CNN
	1    2950 3100
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0312
U 1 1 60D37E98
P 5700 3400
F 0 "#PWR0312" H 5700 3250 50  0001 C CNN
F 1 "VCC" H 5715 3573 50  0000 C CNN
F 2 "" H 5700 3400 50  0001 C CNN
F 3 "" H 5700 3400 50  0001 C CNN
	1    5700 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C301
U 1 1 60D10AEB
P 4700 3550
F 0 "C301" H 4800 3550 50  0000 L CNN
F 1 "0.33uF" H 4800 3450 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 4738 3400 50  0001 C CNN
F 3 "~" H 4700 3550 50  0001 C CNN
	1    4700 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C302
U 1 1 60D10DA6
P 5700 3550
F 0 "C302" H 5815 3596 50  0000 L CNN
F 1 "0.1uF" H 5815 3505 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 5738 3400 50  0001 C CNN
F 3 "~" H 5700 3550 50  0001 C CNN
	1    5700 3550
	1    0    0    -1  
$EndComp
Connection ~ 4700 3400
Connection ~ 5700 3400
Wire Wire Line
	4700 3700 5200 3700
Connection ~ 5200 3700
Wire Wire Line
	5200 3700 5700 3700
$Comp
L Connector_Generic:Conn_01x04 J304
U 1 1 60D768F4
P 2400 4400
F 0 "J304" H 2480 4392 50  0000 L CNN
F 1 "Test" H 2480 4301 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 2400 4400 50  0001 C CNN
F 3 "~" H 2400 4400 50  0001 C CNN
	1    2400 4400
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0301
U 1 1 60D82495
P 1600 4600
F 0 "#PWR0301" H 1600 4450 50  0001 C CNN
F 1 "VCC" H 1615 4773 50  0000 C CNN
F 2 "" H 1600 4600 50  0001 C CNN
F 3 "" H 1600 4600 50  0001 C CNN
	1    1600 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 4600 1950 4600
Wire Wire Line
	1950 4500 2200 4500
Wire Wire Line
	2200 4400 2050 4400
Wire Wire Line
	2050 4300 2200 4300
Wire Wire Line
	1950 4500 1950 4600
Wire Wire Line
	1600 4600 1950 4600
Connection ~ 1950 4600
Wire Wire Line
	2050 4300 2050 4350
Connection ~ 2050 4350
Wire Wire Line
	2050 4350 2050 4400
Text GLabel 5150 1100 2    50   Output ~ 0
NC1
Text GLabel 5150 1200 2    50   Output ~ 0
COM1
Text GLabel 5150 1300 2    50   Output ~ 0
NO1
Text GLabel 5150 1400 2    50   Output ~ 0
NC2
Text GLabel 5150 1500 2    50   Output ~ 0
COM2
Text GLabel 5150 1600 2    50   Output ~ 0
NO2
Text GLabel 5150 1700 2    50   Output ~ 0
NC3
Text GLabel 5150 1800 2    50   Output ~ 0
COM3
Text GLabel 5150 1900 2    50   Output ~ 0
NO3
Text GLabel 5150 2000 2    50   Output ~ 0
NC4
Text GLabel 5150 2100 2    50   Output ~ 0
COM4
Text GLabel 5150 2200 2    50   Output ~ 0
NO4
Text GLabel 5150 2300 2    50   Output ~ 0
NC5
Text GLabel 5150 2400 2    50   Output ~ 0
COM5
Text GLabel 5150 2500 2    50   Output ~ 0
NO5
Text GLabel 5150 2600 2    50   Output ~ 0
NC6
Text GLabel 5150 2700 2    50   Output ~ 0
COM6
Text GLabel 5150 2800 2    50   Output ~ 0
NO6
Wire Wire Line
	4700 1100 5150 1100
Wire Wire Line
	4700 1200 5150 1200
Wire Wire Line
	4700 1300 5150 1300
Wire Wire Line
	4700 1400 5150 1400
Wire Wire Line
	4700 1500 5150 1500
Wire Wire Line
	4700 1600 5150 1600
Wire Wire Line
	4700 1700 5150 1700
Wire Wire Line
	4700 1800 5150 1800
Wire Wire Line
	4700 1900 5150 1900
Wire Wire Line
	4700 2000 5150 2000
Wire Wire Line
	4700 2100 5150 2100
Wire Wire Line
	4700 2200 5150 2200
Wire Wire Line
	4700 2400 5150 2400
Wire Wire Line
	4700 2500 5150 2500
Wire Wire Line
	5050 2600 5150 2600
Wire Wire Line
	4700 2700 5150 2700
Wire Wire Line
	4700 2800 5150 2800
Wire Wire Line
	5050 2300 5150 2300
Text GLabel 10050 850  0    50   Output ~ 0
+5V
Text GLabel 10050 1050 0    50   Output ~ 0
GND
$Comp
L power:VCC #PWR0313
U 1 1 6189302E
P 10450 850
F 0 "#PWR0313" H 10450 700 50  0001 C CNN
F 1 "VCC" H 10465 1023 50  0000 C CNN
F 2 "" H 10450 850 50  0001 C CNN
F 3 "" H 10450 850 50  0001 C CNN
	1    10450 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 850  10450 850 
Wire Wire Line
	10050 1050 10450 1050
$Comp
L power:GND #PWR0314
U 1 1 61898995
P 10450 1050
F 0 "#PWR0314" H 10450 800 50  0001 C CNN
F 1 "GND" H 10550 900 50  0000 R CNN
F 2 "" H 10450 1050 50  0001 C CNN
F 3 "" H 10450 1050 50  0001 C CNN
	1    10450 1050
	1    0    0    -1  
$EndComp
Text HLabel 4700 1300 0    50   Output ~ 0
BRK_SIG
Text HLabel 4700 1900 0    50   Output ~ 0
TTLS_SIG
Text HLabel 2500 3000 2    50   Output ~ 0
A0
Text HLabel 2500 3600 2    50   Output ~ 0
STR_LFT
Text HLabel 2500 3700 2    50   Output ~ 0
STR_RT
Wire Wire Line
	1700 5950 2250 5950
Wire Wire Line
	1700 5850 2250 5850
$Comp
L power:VCC #PWR0302
U 1 1 6194564E
P 1700 5850
F 0 "#PWR0302" H 1700 5700 50  0001 C CNN
F 1 "VCC" H 1715 6023 50  0000 C CNN
F 2 "" H 1700 5850 50  0001 C CNN
F 3 "" H 1700 5850 50  0001 C CNN
	1    1700 5850
	1    0    0    -1  
$EndComp
Text Notes 900  6350 0    50   ~ 0
Master Switch net connects to IN1- IN4 of A/M relays
Text HLabel 1700 5950 0    50   Output ~ 0
MasterSwitch
$Comp
L power:GND #PWR0103
U 1 1 618AAC8A
P 2050 4350
F 0 "#PWR0103" H 2050 4100 50  0001 C CNN
F 1 "GND" H 2055 4177 50  0000 C CNN
F 2 "" H 2050 4350 50  0001 C CNN
F 3 "" H 2050 4350 50  0001 C CNN
	1    2050 4350
	0    1    1    0   
$EndComp
$EndSCHEMATC
