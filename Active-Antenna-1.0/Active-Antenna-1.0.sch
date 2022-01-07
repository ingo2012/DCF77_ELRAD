EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Device:L_Core_Ferrite L1
U 1 1 61BEE520
P 4100 3900
F 0 "L1" H 4057 3854 50  0000 R CNN
F 1 "Antenne" H 4057 3945 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4100 3900 50  0001 C CNN
F 3 "~" H 4100 3900 50  0001 C CNN
	1    4100 3900
	1    0    0    1   
$EndComp
$Comp
L Device:C_Small C1
U 1 1 61BF1284
P 4400 3900
F 0 "C1" H 4492 3946 50  0000 L CNN
F 1 "1532pF" H 4492 3855 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.6mm_W3.0mm_P2.50mm_MKS02_FKP02" H 4400 3900 50  0001 C CNN
F 3 "~" H 4400 3900 50  0001 C CNN
	1    4400 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 61BF2888
P 5250 4000
F 0 "R3" H 5309 4046 50  0000 L CNN
F 1 "2K2" H 5309 3955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" H 5250 4000 50  0001 C CNN
F 3 "~" H 5250 4000 50  0001 C CNN
	1    5250 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R2
U 1 1 61BF49BA
P 5250 2900
F 0 "R2" H 5309 2946 50  0000 L CNN
F 1 "150" H 5309 2855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" H 5250 2900 50  0001 C CNN
F 3 "~" H 5250 2900 50  0001 C CNN
	1    5250 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R5
U 1 1 61BF5DEF
P 6250 2900
F 0 "R5" H 6309 2946 50  0000 L CNN
F 1 "3K3" H 6309 2855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" H 6250 2900 50  0001 C CNN
F 3 "~" H 6250 2900 50  0001 C CNN
	1    6250 2900
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC549 Q2
U 1 1 61BF787B
P 6150 3600
F 0 "Q2" H 6500 3750 50  0000 C CNN
F 1 "BC546B" H 6550 3650 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 6350 3525 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 6150 3600 50  0001 L CNN
	1    6150 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 61BF885D
P 4100 4350
F 0 "#PWR02" H 4100 4100 50  0001 C CNN
F 1 "GND" H 4105 4177 50  0000 C CNN
F 2 "" H 4100 4350 50  0001 C CNN
F 3 "" H 4100 4350 50  0001 C CNN
	1    4100 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4050 4100 4250
Wire Wire Line
	4400 4000 4400 4250
Wire Wire Line
	4400 4250 4100 4250
Connection ~ 4100 4250
Wire Wire Line
	4100 4250 4100 4350
Wire Wire Line
	4400 4250 4850 4250
Wire Wire Line
	5250 4250 5250 4100
Connection ~ 4400 4250
Connection ~ 5250 4250
Wire Wire Line
	4950 3500 4850 3500
Wire Wire Line
	4400 3500 4400 3800
Wire Wire Line
	4400 3500 4100 3500
Wire Wire Line
	4100 3500 4100 3750
Connection ~ 4400 3500
$Comp
L Device:C_Small C7
U 1 1 61BF52B0
P 6600 3950
F 0 "C7" H 6692 3996 50  0000 L CNN
F 1 "560nF" H 6692 3905 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.6mm_W3.0mm_P2.50mm_MKS02_FKP02" H 6600 3950 50  0001 C CNN
F 3 "~" H 6600 3950 50  0001 C CNN
	1    6600 3950
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR06
U 1 1 61C05EAE
P 7250 2650
F 0 "#PWR06" H 7250 2500 50  0001 C CNN
F 1 "+12V" V 7265 2778 50  0000 L CNN
F 2 "" H 7250 2650 50  0001 C CNN
F 3 "" H 7250 2650 50  0001 C CNN
	1    7250 2650
	0    1    1    0   
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 61C14A51
P 7200 2650
F 0 "#FLG02" H 7200 2725 50  0001 C CNN
F 1 "PWR_FLAG" H 7200 2823 50  0000 C CNN
F 2 "" H 7200 2650 50  0001 C CNN
F 3 "~" H 7200 2650 50  0001 C CNN
	1    7200 2650
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 61C17D8A
P 3750 2650
F 0 "J1" H 3722 2532 50  0000 R CNN
F 1 "Ub" H 3722 2623 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3750 2650 50  0001 C CNN
F 3 "~" H 3750 2650 50  0001 C CNN
	1    3750 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 61C196A8
P 4100 2750
F 0 "#PWR01" H 4100 2500 50  0001 C CNN
F 1 "GND" H 4105 2577 50  0000 C CNN
F 2 "" H 4100 2750 50  0001 C CNN
F 3 "" H 4100 2750 50  0001 C CNN
	1    4100 2750
	0    -1   -1   0   
$EndComp
$Comp
L Device:Q_NJFET_GSD Q1
U 1 1 61CB6779
P 5150 3500
F 0 "Q1" H 5340 3546 50  0000 L CNN
F 1 "BF256C" H 5340 3455 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 5350 3600 50  0001 C CNN
F 3 "~" H 5150 3500 50  0001 C CNN
	1    5150 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 61BF2E20
P 5500 3750
F 0 "C4" V 5600 3700 50  0000 L CNN
F 1 "100n" V 5700 3700 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.6mm_W3.0mm_P2.50mm_MKS02_FKP02" H 5500 3750 50  0001 C CNN
F 3 "~" H 5500 3750 50  0001 C CNN
	1    5500 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	5250 3700 5250 3750
Wire Wire Line
	5250 4250 6250 4250
Wire Wire Line
	5400 3750 5250 3750
Connection ~ 5250 3750
Wire Wire Line
	5250 3750 5250 3900
$Comp
L Device:RTRIM R4
U 1 1 61CBFFDD
P 5950 3450
F 0 "R4" H 6000 3900 50  0000 L CNN
F 1 "100K" H 6000 3800 50  0000 L CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3339P_Vertical_HandSoldering" V 5880 3450 50  0001 C CNN
F 3 "~" H 5950 3450 50  0001 C CNN
	1    5950 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 3750 5750 3750
Wire Wire Line
	5750 3750 5750 3600
Wire Wire Line
	5950 3600 5750 3600
Wire Wire Line
	6250 3400 6250 3200
Wire Wire Line
	6250 3200 5950 3200
$Comp
L Device:R_Small R6
U 1 1 61CC164E
P 6250 4000
F 0 "R6" H 6309 4046 50  0000 L CNN
F 1 "470" H 6309 3955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" H 6250 4000 50  0001 C CNN
F 3 "~" H 6250 4000 50  0001 C CNN
	1    6250 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 3800 6250 3900
Wire Wire Line
	6250 4100 6250 4250
Connection ~ 6250 4250
Wire Wire Line
	6600 3850 6600 3800
Wire Wire Line
	6600 3800 6250 3800
Connection ~ 6250 3800
Wire Wire Line
	6600 4050 6600 4250
Wire Wire Line
	6250 4250 6600 4250
Wire Wire Line
	6250 3200 6250 3000
Connection ~ 6250 3200
Wire Wire Line
	5250 2650 5250 2800
Wire Wire Line
	5250 3000 5250 3300
Wire Wire Line
	5250 2650 6250 2650
Wire Wire Line
	6250 2650 6250 2800
$Comp
L Device:C_Small C8
U 1 1 61CC7784
P 6800 3200
F 0 "C8" V 6550 3150 50  0000 L CNN
F 1 "100n" V 6650 3150 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.6mm_W3.0mm_P2.50mm_MKS02_FKP02" H 6800 3200 50  0001 C CNN
F 3 "~" H 6800 3200 50  0001 C CNN
	1    6800 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	6700 3200 6250 3200
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 61CC8A75
P 7300 3300
F 0 "J2" H 7272 3182 50  0000 R CNN
F 1 "Out" H 7272 3273 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7300 3300 50  0001 C CNN
F 3 "~" H 7300 3300 50  0001 C CNN
	1    7300 3300
	-1   0    0    1   
$EndComp
Wire Wire Line
	7100 3200 6900 3200
Wire Wire Line
	7100 3300 7100 4250
Wire Wire Line
	7100 4250 6600 4250
Connection ~ 6600 4250
$Comp
L Device:C_Small C5
U 1 1 61CCCBBA
P 5750 3450
F 0 "C5" H 5700 3000 50  0000 L CNN
F 1 "220pF" H 5600 3100 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.6mm_W3.0mm_P2.50mm_MKS02_FKP02" H 5750 3450 50  0001 C CNN
F 3 "~" H 5750 3450 50  0001 C CNN
	1    5750 3450
	-1   0    0    1   
$EndComp
Connection ~ 5950 3600
Wire Wire Line
	5750 3200 5750 3350
Wire Wire Line
	5750 3600 5750 3550
Connection ~ 5750 3600
Wire Wire Line
	5950 3300 5950 3200
Connection ~ 5950 3200
Wire Wire Line
	5950 3200 5750 3200
Connection ~ 6250 2650
$Comp
L Device:R_Small R1
U 1 1 61CD5CE6
P 4850 3900
F 0 "R1" H 4909 3946 50  0000 L CNN
F 1 "1M" H 4909 3855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" H 4850 3900 50  0001 C CNN
F 3 "~" H 4850 3900 50  0001 C CNN
	1    4850 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3800 4850 3500
Connection ~ 4850 3500
Wire Wire Line
	4850 3500 4400 3500
Wire Wire Line
	4850 4000 4850 4250
Connection ~ 4850 4250
Wire Wire Line
	4850 4250 5250 4250
Wire Wire Line
	3950 2750 4000 2750
$Comp
L power:PWR_FLAG #FLG01
U 1 1 61CDB186
P 4000 2750
F 0 "#FLG01" H 4000 2825 50  0001 C CNN
F 1 "PWR_FLAG" H 4000 2923 50  0000 C CNN
F 2 "" H 4000 2750 50  0001 C CNN
F 3 "~" H 4000 2750 50  0001 C CNN
	1    4000 2750
	-1   0    0    1   
$EndComp
Connection ~ 4000 2750
Wire Wire Line
	4000 2750 4100 2750
$Comp
L Device:C_Small C6
U 1 1 61CE6D5E
P 6500 2800
F 0 "C6" H 6592 2846 50  0000 L CNN
F 1 "100nF" H 6592 2755 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.6mm_W3.0mm_P2.50mm_MKS02_FKP02" H 6500 2800 50  0001 C CNN
F 3 "~" H 6500 2800 50  0001 C CNN
	1    6500 2800
	1    0    0    -1  
$EndComp
Connection ~ 7200 2650
Wire Wire Line
	7200 2650 7250 2650
$Comp
L power:GND #PWR05
U 1 1 61CE7F34
P 6500 2950
F 0 "#PWR05" H 6500 2700 50  0001 C CNN
F 1 "GND" H 6505 2777 50  0000 C CNN
F 2 "" H 6500 2950 50  0001 C CNN
F 3 "" H 6500 2950 50  0001 C CNN
	1    6500 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 2950 6500 2900
Wire Wire Line
	6250 2650 6500 2650
Wire Wire Line
	6500 2700 6500 2650
Connection ~ 6500 2650
Wire Wire Line
	6500 2650 7200 2650
$Comp
L Device:C_Small C3
U 1 1 61CEB743
P 4850 2850
F 0 "C3" H 4942 2896 50  0000 L CNN
F 1 "100nF" H 4942 2805 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.6mm_W3.0mm_P2.50mm_MKS02_FKP02" H 4850 2850 50  0001 C CNN
F 3 "~" H 4850 2850 50  0001 C CNN
	1    4850 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C2
U 1 1 61CEC361
P 4500 2850
F 0 "C2" H 4588 2896 50  0000 L CNN
F 1 "10µF" H 4588 2805 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4500 2850 50  0001 C CNN
F 3 "~" H 4500 2850 50  0001 C CNN
	1    4500 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 61CEEAFC
P 4500 3000
F 0 "#PWR03" H 4500 2750 50  0001 C CNN
F 1 "GND" H 4505 2827 50  0000 C CNN
F 2 "" H 4500 3000 50  0001 C CNN
F 3 "" H 4500 3000 50  0001 C CNN
	1    4500 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 61CEF159
P 4850 3000
F 0 "#PWR04" H 4850 2750 50  0001 C CNN
F 1 "GND" H 4855 2827 50  0000 C CNN
F 2 "" H 4850 3000 50  0001 C CNN
F 3 "" H 4850 3000 50  0001 C CNN
	1    4850 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3000 4500 2950
Wire Wire Line
	4850 3000 4850 2950
Wire Wire Line
	4850 2750 4850 2650
Wire Wire Line
	3950 2650 4500 2650
Wire Wire Line
	4500 2750 4500 2650
Connection ~ 4500 2650
Wire Wire Line
	4500 2650 4850 2650
Wire Wire Line
	4850 2650 5250 2650
Connection ~ 4850 2650
Connection ~ 5250 2650
$EndSCHEMATC