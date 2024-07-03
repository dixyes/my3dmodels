height = 1.6;
length = 80;
pillers = [30, 42, 60];
pillerDiameter = 3;
pillerHeight = 1;

interfaceLength = 4;
tailLength = 6;

width = 22;

$fn = $preview ? 16 : 64;

cube(
    [
        length - interfaceLength - tailLength,
        width,
        height
    ],
    center = false
);

for (i = pillers) {
    translate([
        i - interfaceLength,
        width / 2,
        height
    ]) {
        cylinder(
            h = pillerHeight,
            d = pillerDiameter,
            center = true
        );
    }
}
