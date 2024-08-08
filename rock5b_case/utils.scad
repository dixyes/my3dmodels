
module screw_pillar(h) {
    difference() {
        cylinder(h = h, d = dPiller);
        cylinder(h = h, d = dScrewHole);
    }
}

module roundcorner_cube(lx, ly, lz, r) {
    // draw round corner rectange
    linear_extrude(lz, center = false)
        hull () {
            translate([r, r, 0])
                circle(r = r);
            translate([lx - r, r, 0])
                circle(r = r);
            translate([r, ly - r, 0])
                circle(r = r);
            translate([lx - r, ly - r, 0])
                circle(r = r);
        }
}
