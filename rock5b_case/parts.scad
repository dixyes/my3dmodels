
module board(lxyFitting = lxyBoardFitting) {
    translate([-lxyFitting, -lxyFitting, 0])
                roundcorner_cube(
                    lxBoard + (2 * lxyFitting),
                    lyBoard + (2 * lxyFitting),
                    lzBoard,
                    rBoard + lxyFitting);
}

module powerTypeC(fitting = lInterfacesFitting) {
    d = (l2TypeC + 2 * fitting);
    r = d / 2;
    translate([
        xPowerTypeC - r,
        yPowerTypeC,
        zPowerTypeC - fitting,
    ])
    rotate([270, 0, 0]) {
        linear_extrude(lyPowerTypeC)
            hull() {
                translate([r, -r, 0])
                    circle(d = d);
                translate([r, -(l1TypeC + fitting - (l2TypeC / 2)), 0])
                    circle(d = d);
            }
    }
}

module jack35(fitting = lInterfacesFitting) {
    translate([xJack35, yJack35, zJack35])
        rotate([270, 0, 0])
            cylinder(d = dJack35 + 2 * fitting, h = lyJack35 + thicknessCase, center = false);
}

module hdmiShape(fitting = 0) {
    polygon([
        [l2HDMI + fitting, fitting],
        [l2HDMI - l1HDMINotch - fitting, fitting],
        [-fitting, -l2HDMINotch + fitting],
        [-fitting, -l1HDMI + l2HDMINotch - fitting],
        [l2HDMI - l1HDMINotch -fitting, -(l1HDMI + fitting)],
        [l2HDMI + fitting, -(l1HDMI + fitting)],
    ]);
}

module hdmiSideShape(fitting = 0) {
    polygon([
        [fitting, fitting],
        [-ly1HDMI - fitting, fitting],
        [-ly1HDMI - fitting, -lz2HDMI - fitting],
        [-ly2HDMI - fitting, -l1HDMI -fitting],
        [fitting, -l1HDMI - fitting],
    ]);
}

module hdmi(fitting = 0) {
    rotate([270, 0, 0])
        intersection() {
            linear_extrude(ly1HDMI)
                hdmiShape(fitting);

            translate([-fitting, 0, 0])
                rotate([0, 90, 0])
                    linear_extrude(lxHDMI + 2 * fitting + 1)
                        polygon([
                            [fitting, fitting],
                            [-ly1HDMI - fitting, fitting],
                            [-ly1HDMI - fitting, -lz2HDMI - fitting],
                            [-ly2HDMI - fitting, -l1HDMI -fitting],
                            [fitting, -l1HDMI - fitting],
                        ]);
        }
}

module hdmi1(fitting = lInterfacesFitting) {
    translate([
        xHDMI1,
        yHDMI1,
        zHDMI1,
    ]) hdmi(fitting);
}

module hdmi2(fitting = lInterfacesFitting) {
    translate([
        xHDMI2,
        yHDMI2,
        zHDMI2,
    ]) hdmi(fitting);
}

module usb2(fitting = lInterfacesFitting) {
    union() {
        translate([
            xUSB2 - fitting,
            yUSB2,
            zUSB2 - fitting,
        ])
            cube([
                lxUSB2 + 2 * fitting,
                lyUSB2,
                lzUSB2 + 2 * fitting,
            ]);
        translate([
            xUSB2 - ((lx2USB2 - lxUSB2) / 2) - fitting,
            yUSB2,
            zUSB2 - ((lz2USB2 - lzUSB2) / 2) - fitting,
        ])
            cube([
                lx2USB2 + 2 * fitting,
                ly2USB2,
                lz2USB2 + 2 * fitting,
            ]);
    }
}

module usb3(fitting = lInterfacesFitting) {
    union() {
        translate([
            xUSB3 - fitting,
            yUSB3,
            zUSB3 - fitting,
        ])
            cube([
                lxUSB3 + 2 * fitting,
                lyUSB3,
                lzUSB3 + 2 * fitting,
            ]);
        translate([
            xUSB3 - ((lx2USB3 - lxUSB3) / 2) - fitting,
            yUSB3,
            zUSB3 - ((lz2USB3 - lzUSB3) / 2) - fitting,
        ])
            cube([
                lx2USB3 + 2 * fitting,
                ly2USB3,
                lz2USB3 + 2 * fitting,
            ]);
    }
}

module rj45(fitting = lInterfacesFitting) {
    translate([
        xRJ45 - fitting,
        yRJ45,
        zRJ45 - fitting,
    ])
        cube([
            lxRJ45 + 2 * fitting,
            lyRJ45,
            lzRJ45 + 2 * fitting,
        ]);
}

module hdmiIn(fitting = lInterfacesFitting) {
    translate([
        xHDMIIn + lxHDMIIn + 3, // make it slighly outside
        yHDMIIn + lyHDMIIn,
        zHDMIIn,
    ])
        rotate([0, 270, 0])
            linear_extrude(lxHDMIIn + 3) // make it slighly outside
                hdmiShape(fitting);
}

module typeC(fitting = lInterfacesFitting) {
    d = dTypeC + 2 * fitting;
    r = d / 2;
    translate([xTypeC - fitting, yTypeC, zTypeC + dTypeC + fitting])
        rotate([270, 0, 0])
            linear_extrude(lyTypeC + 2) // make it slighly outside
                hull () {
                    translate([r, r])
                        circle(d = d);
                    translate([lxTypeC + fitting - (l2TypeC / 2), r])
                        circle(d = d);
                }
}

module bottomInterfacePadding(x, lx, lz, fitting = lInterfacesFitting) {
    translate([
        x - fitting,
        -(lxyBoardFitting + thicknessCase),
        lzBoard
    ]) {
        cube([
            lx + 2 * fitting,
            thicknessCase,
            lz,
        ], center = false);
    }
}

module vent() {
    lines = [
        [[10, 10], [10, 10],],
        [[20, 10], [10, 20],],
        [[30, 10], [10, 30],],
        [[40, 10], [10, 40],],
        [[50, 10], [10, 50],],
        [[60, 10], [10, 60],],
        [[70, 10], [15, 65],],
        [[80, 10], [25, 65],],
        [[90, 10], [35, 65],],
        [[90, 20], [45, 65],],
        [[90, 30], [55, 65],],
        [[90, 40], [65, 65],],
        [[90, 50], [75, 65],],
        [[90, 60], [85, 65],],
    ];
    translate([0, 0,-40])
        linear_extrude(100)
            union() {
                for (line = lines) {
                    hull() {
                        translate(line[0])
                            circle(d = 5);
                        translate(line[1])
                            circle(d = 5);
                    }
                }
            }
}

module debug() {
    // debug
    if (debug) {
        color([0, 0, 0, 0.3]) {
            board(0);
            jack35(0);
            powerTypeC(0);
            hdmi1(0);
            hdmi2(0);
            usb2(0);
            usb3(0);
            rj45(0);
            hdmiIn(0);
            typeC(0);
        }
        // color([0, 0, 1, 0.3]) {
        //     vent();
        // }
    }
}
