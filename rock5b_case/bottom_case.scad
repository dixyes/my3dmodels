
include <values.scad>;
include <utils.scad>;
include <parts.scad>;

debug = $preview;

noDetails = true;
noBottomInterfacePadding = true;

thicknessCase = 1.5;

lzBottomSpace = lzM2Slot + 1;

// 2x M2 2280 slot
// zM2SlotClearance = -4;
zM2SlotClearance = -40; // disabled
lzM2SlotClearance = 40;
rM2SlotClearance = 1;
lxyM2Fitting = 0.2;

m2SlotClearance = zM2SlotClearance > -(lzBottomSpace + thicknessCase);
// start build

lxCase = lxBoard + (2 * thicknessCase) + (2 * lxyBoardFitting);
lyCase = lyBoard + (2 * thicknessCase) + (2 * lxyBoardFitting);

difference() {
    union() {
        // bottom case
        difference() {
            // case
            translate([
                -(thicknessCase + lxyBoardFitting),
                -(thicknessCase + lxyBoardFitting),
                -(lzBottomSpace + thicknessCase)])
                roundcorner_cube(
                    lxCase,
                    lyCase,
                    lzBottomSpace + thicknessCase + lzBoard,
                    rBoard + thicknessCase
                );
            // board
            translate([-lxyBoardFitting, -lxyBoardFitting, -lzBottomSpace])
                roundcorner_cube(
                    lxBoard + (2 * lxyBoardFitting),
                    lyBoard + (2 * lxyBoardFitting),
                    lzBottomSpace + thicknessCase + lzBoard,
                    rBoard + lxyBoardFitting);
        }

        // pillars
        for (positionPillar = positionPillars5) {
            x = positionPillar[0];
            y = positionPillar[1];
            translate([x, y, -lzBottomSpace])
                screw_pillar(lzBottomSpace);
        }

        // interfaces
        if (!noBottomInterfacePadding) {
            if (!noDetails) {
                // 3.5mm jack
                bottomInterfacePadding(
                    xJack35 - (dJack35 / 2),
                    dJack35,
                    zJack35 - lzBoard
                );

                // power type C
                bottomInterfacePadding(
                    xPowerTypeC - (dTypeC / 2),
                    dTypeC,
                    dTypeC / 2
                );
            }

            // HDMI1
            bottomInterfacePadding(
                xHDMI1 + 0.01,
                lxHDMI - 0.02,
                noDetails ? zHDMI1 - lzBoard - lInterfacesFitting : lxHDMICorner
            );
        
            // HDMI2
            bottomInterfacePadding(
                xHDMI2 + 0.01,
                lxHDMI - 0.02,
                noDetails ? zHDMI2 - lzBoard - lInterfacesFitting : lxHDMICorner
            );

            // USB 2.0
            bottomInterfacePadding(
                xUSB2,
                lxUSB2,
                zUSB2 - lzBoard
            );

            // USB 3.0
            bottomInterfacePadding(
                xUSB3,
                lxUSB3,
                zUSB3 - lzBoard
            );

            if (!noDetails) {
                // HDMI IN
                translate([
                    lxBoard + lxyBoardFitting,
                    yHDMIIn + 0.01,
                    lzBoard,
                ])
                    cube([thicknessCase, lyHDMIIn - 0.02, lxHDMICorner]);
            }
        }
    }
    union() {
        // screw holes
        for (positionPillar = positionPillars5) {
            x = positionPillar[0];
            y = positionPillar[1];
            translate([x, y, -(lzBottomSpace + thicknessCase)])
                cylinder(h = lzBottomSpace + 2 * thicknessCase, d = dScrewHole);
        }

        if (m2SlotClearance) {
            // m2 slot clearance
            translate([
                xM2Slot + 2 * lxyM2Fitting,
                yM2Slot + 2 * lxyM2Fitting,
                zM2SlotClearance-lzM2SlotClearance
            ])
                roundcorner_cube(
                    lxM2Slot + 2 * lxyM2Fitting,
                    lyM2Slot + 2 * lxyM2Fitting,
                    lzM2SlotClearance,
                    rM2SlotClearance
                );
        }

        // interfaces
        jack35();
        powerTypeC();
        hdmi1();
        hdmi2();
        // hdmiIn();

        if (!m2SlotClearance) {
            vent();
        }
    }
}

debug();
