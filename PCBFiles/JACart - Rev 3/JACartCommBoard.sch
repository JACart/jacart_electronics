EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 1900 950  2050 1600
U 617892B8
F0 "Nano Side" 50
F1 "Nano Side.sch" 50
F2 "A0" I R 3950 1100 50 
F3 "BKA" I R 3950 2300 50 
F4 "TLA" I R 3950 2400 50 
F5 "BRK_SIG" I R 3950 1250 50 
F6 "TTL_SIG" I R 3950 1400 50 
F7 "STR_LFT" I R 3950 1550 50 
F8 "STR_RT" I R 3950 1700 50 
$EndSheet
$Sheet
S 6050 800  2100 2050
U 6181850E
F0 "Power-Signal Distribution" 50
F1 "Power-Signal Distribution.sch" 50
F2 "BRK_SIG" O L 6050 1250 50 
F3 "TTLS_SIG" O L 6050 1400 50 
F4 "A0" O L 6050 1100 50 
F5 "STR_LFT" O L 6050 1550 50 
F6 "STR_RT" O L 6050 1700 50 
F7 "MasterSwitch" O L 6050 2400 50 
$EndSheet
$Sheet
S 1200 3650 2750 1650
U 617939C9
F0 "Relays" 50
F1 "Relays.sch" 50
F2 "IN5" O R 3950 3800 50 
F3 "IN6" O R 3950 3900 50 
F4 "MasterSwitch" O R 3950 4250 50 
$EndSheet
Wire Wire Line
	3950 4250 5300 4250
Wire Wire Line
	5300 4250 5300 2400
Wire Wire Line
	5300 2400 6050 2400
Text Notes 4150 4650 0    50   ~ 0
Double-check which input (TLA or BKA) is IN5 and IN6\n
Wire Wire Line
	3950 3800 4050 3800
Wire Wire Line
	4050 3800 4050 2400
Wire Wire Line
	4050 2400 3950 2400
Wire Wire Line
	3950 2300 4150 2300
Wire Wire Line
	4150 2300 4150 3900
Wire Wire Line
	4150 3900 3950 3900
Text Notes 4700 4800 0    50   ~ 0
TLA>5, BKA>6
Wire Wire Line
	3950 1100 6050 1100
Wire Wire Line
	6050 1250 3950 1250
Wire Wire Line
	3950 1400 6050 1400
Wire Wire Line
	6050 1550 3950 1550
Wire Wire Line
	3950 1700 6050 1700
$EndSCHEMATC
