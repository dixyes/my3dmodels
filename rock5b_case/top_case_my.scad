
include <values.scad>;
include <utils.scad>;
include <parts.scad>;

debug = $preview;

thicknessCase = 1.5;

lzTopSpace =  20;

vent = true;

positionPillars = positionPillars5;

// start build

lxCase = lxBoard + (2 * thicknessCase) + (2 * lxyBoardFitting);
lyCase = lyBoard + (2 * thicknessCase) + (2 * lxyBoardFitting);

difference() {
    union() {
        difference() {
            translate([
                -thicknessCase - lxyBoardFitting,
                -thicknessCase - lxyBoardFitting,
                lzBoard,
            ])
                roundcorner_cube(
                    lxCase,
                    lyCase,
                    lzTopSpace,
                    rBoard + thicknessCase
                );
            translate([
                -lxyBoardFitting,
                -lxyBoardFitting,
                0])
                roundcorner_cube(
                    lxBoard + (2 * lxyBoardFitting),
                    lyBoard + (2 * lxyBoardFitting),
                    lzTopSpace,
                    rBoard + lxyBoardFitting);
        }

        // screw pillars
        for (positionPillar = positionPillars) {
            x = positionPillar[0];
            y = positionPillar[1];
            translate([x, y, lzBoard])
                cylinder(d = dPiller, h = lzTopSpace - lzBoard);
        }
    }

    union() {
        // screw holes
        for (positionPillar = positionPillars) {
            x = positionPillar[0];
            y = positionPillar[1];
            translate([x, y, 0])
                cylinder(d = dScrewHole, h = lzTopSpace + 10);
        }

        // 3.5mm jack
        bottomInterfacePadding(
            xJack35 - (dJack35 / 2),
            dJack35,
            zJack35 - lzBoard
        );
        jack35();

        // power type C
        bottomInterfacePadding(
            xPowerTypeC - (dTypeC / 2),
            dTypeC,
            dTypeC + lInterfacesFitting
        );
        powerTypeC();

        // HDMI1
        bottomInterfacePadding(
            xHDMI1 + 0.01,
            lxHDMI - 0.02,
            lxHDMICorner
        );
        hdmi1();

        // HDMI2
        bottomInterfacePadding(
            xHDMI2 + 0.01,
            lxHDMI - 0.02,
            lxHDMICorner
        );
        hdmi2();

        // USB 2.0
        bottomInterfacePadding(
            xUSB2,
            lxUSB2,
            zUSB2 - lzBoard
        );
        usb2();

        // USB 3.0
        bottomInterfacePadding(
            xUSB3,
            lxUSB3,
            zUSB3 - lzBoard
        );
        usb3();

        // RJ45
        rj45();
        
        // HDMI IN
        translate([
            lxBoard + lxyBoardFitting,
            yHDMIIn + 0.01,
            lzBoard,
        ])
            cube([thicknessCase, lyHDMIIn - 0.02, lxHDMICorner]);
        hdmiIn();


        // full function type C
        translate([
            xTypeC,
            lyBoard + lxyBoardFitting,
            lzBoard,
        ])
            cube([
                lxTypeC,
                thicknessCase,
                dTypeC / 2,
            ]);
        typeC();
    }

    if (!fanHole && vent)
        vent();

    

    // translate([-10, 10, 0])
    //     cube(200);
}

debug();
