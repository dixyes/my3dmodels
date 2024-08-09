// fitting
lxyBoardFitting = 0.7;
lInterfacesFitting = 0.5;

// main pcb
lxBoard = 100.19; // from step
lyBoard = 74.24; // from step
lzBoard = 1.5; // from step
rBoard = 3; // from step

// screw pillar
dScrewHole = 3.51; // from step
dPiller = 5.40; // maximum diameter of pillars
positionPillars5 = [
    [3.52, 21.69],
    [3.52, 70.69],
    [61.57, 70.69],
    [96.67, 70.69],
    [96.67, 21.69],
]; // from step
positionPillars4 = [
    [3.52, 21.69],
    [3.52, 70.69],
    [96.67, 70.69],
    [96.67, 21.69],
]; // from step

// 2x M2 2280 slot
xM2Slot = 0;
yM2Slot = 23.34;
// zM2Slot is -lzM2Slot
lxM2Slot = 85;
lyM2Slot = 44.4;
lzM2Slot = 5.5;

// 3.5mm
xJack35 = 6;
yJack35 = -2.66; // from step
zJack35 = 3.8; // from step
dJack35 = 6; // from step
lyJack35 = 2.2; // from step

// type C
l1TypeC = 9;
l2TypeC = 3;
dTypeC = l2TypeC;

// power type c
xPowerTypeC = 15.47; // from step
yPowerTypeC = -2.91; // from step
zPowerTypeC = 2.16; // from step
lxPowerTypeC = l1TypeC;
lyPowerTypeC = 14.2; // from step
lzPowerTypeC = l2TypeC;

// HDMI
l1HDMI = 15;
l2HDMI = 5.6;
l1HDMINotch = 4.4;
l2HDMINotch = 2;

// HDMI 1/2
lxHDMI = l2HDMI;
ly1HDMI = 24;
ly2HDMI = 16;
lz1HDMI = l1HDMI;
lz2HDMI = 8;

lxHDMICorner = 4;

xHDMI1 = 21.8;
yHDMI1 = -3.8; // from step
zHDMI1 = 2.8; // from step

xHDMI2 = 34.5;
yHDMI2 = -3.8; // from step
zHDMI2 = 2.8; // from step

// USB 2.0
lxUSB2 = 13.3;
lx2USB2 = 15;
lyUSB2 = 17.5;
ly2USB2 = 1.5;
lzUSB2 = 14.5;
lz2USB2 = 15.5;

xUSB2 = 45.87; // from step
yUSB2 = -3.76;
zUSB2 = 2.55; // from step

// USB 3.0
lxUSB3 = 13.3;
lx2USB3 = 15;
lyUSB3 = 17.5;
ly2USB3 = 1.5;
lzUSB3 = 14.5;
lz2USB3 = 15.5;

xUSB3 = 64.54; // from step
yUSB3 = -3.76;
zUSB3 = 2.55; // from step

// RJ45
lxRJ45 = 16;
lyRJ45 = 22;
lzRJ45 = 14;

xRJ45 = 82.02; // from step
yRJ45 = -3.61;
zRJ45 = lzBoard;

// HDMI IN
lxHDMIIn = 9.5;
lyHDMIIn = l1HDMI;
xHDMIIn = 91.8;
yHDMIIn = 25;
zHDMIIn = 2.2;

// full function type C
lyTypeC = 7.5; // from step
lxTypeC = l1TypeC;

xTypeC = 65.5; // from step
yTypeC = 67.8; // from step
zTypeC = lzBoard;

// render settings
$fn = $preview ? 16 : 64;
$fs = 0.15;
