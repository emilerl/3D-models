$fa = 1;
$fs = 0.4;

PADDING = 0.001;

// Manfrotto mount plate specifications
POLYGON_SIDES = 6;
BOTTOM_POLYGON_R = 34;
TOP_POLYGON_R = 30;
EXTRUDED_POLYGON_HEIGHT = 8.7;
FILLET_R = 0;

module circumscribed_polygon(radius,fn) {
    // Modified from https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/undersized_circular_objects
    fudge = 1/cos(180/fn);
    circle(radius*fudge,$fn=fn);
}

module manfrotto_polygon_mount() {
    translate([0,0,EXTRUDED_POLYGON_HEIGHT/2])
    minkowski() {
        linear_extrude(height=EXTRUDED_POLYGON_HEIGHT, center=true, scale=TOP_POLYGON_R/BOTTOM_POLYGON_R)
        circumscribed_polygon(BOTTOM_POLYGON_R, POLYGON_SIDES);
        sphere(FILLET_R); 
    }
}

module nanlite_module() {
    union() {
        manfrotto_polygon_mount();
        minkowski() {
            translate([0,0,EXTRUDED_POLYGON_HEIGHT-PADDING])
            cylinder(30, r1=6.75, r2=6.75);
            sphere(FILLET_R);
        }
        translate([0,0,EXTRUDED_POLYGON_HEIGHT-PADDING])
        cylinder(5, r=8);

        translate([0,0,EXTRUDED_POLYGON_HEIGHT-PADDING+20])
        cylinder(5, r1=6.75, r2=8);

        translate([0,0,EXTRUDED_POLYGON_HEIGHT-PADDING+25])
        cylinder(5, r1=8, r2=8);

    }
}

nanlite_module();
//manfrotto_polygon_mount();
    
