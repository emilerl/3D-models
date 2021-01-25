$fa = 1;
$fs = 0.4;


module hook_part(outer_radius, inner_radius, quadrant_degrees = 0) {

    difference() {
        difference() {
            circle(outer_radius);
            circle(inner_radius);
        }

        rotate([0,0,quadrant_degrees])
        square(outer_radius);
    }
    
    rotate([0,0,quadrant_degrees])
    translate([inner_radius + ((outer_radius-inner_radius) / 2), 0,0])
    circle((outer_radius-inner_radius) / 2);
    
    rotate([0,0,quadrant_degrees+90])
    translate([inner_radius + ((outer_radius-inner_radius) / 2), 0,0])
    circle((outer_radius-inner_radius) / 2);
    
}

module hook_outline(outer_radius, inner_radius) {
    thickness = (outer_radius-inner_radius) /2;
    translate([0,inner_radius + thickness,0])
    hook_part(outer_radius,inner_radius, 180);

    translate([0,-inner_radius-thickness,0])
    hook_part(outer_radius,inner_radius, 0);
}

module extruded_hook(outer_radius, inner_radius, height) {
    linear_extrude(height)
    hook_outline(15,10);
}

module asymetric_hook_outline(outer_r1, outer_r2, width) {
    
    inner_r1 = outer_r1 - width;
    inner_r2 = outer_r2 - width;
    
    translate([0,-(outer_r1+outer_r2)/2,0])
    union() {
        translate([0,inner_r1+(outer_r1-inner_r1)/2,0])
        hook_part(outer_r1,inner_r1, 180);

        translate([0,-inner_r2-((outer_r2-inner_r2)/2),0])
        hook_part(outer_r2,inner_r2,0);
    }
}

module extruded_assymetric_hook(outer_r1, outer_r2, width, height) {
    linear_extrude(height)
    asymetric_hook_outline(outer_r1, outer_r2, width);    
}


color("red")

translate([40,0,0])
extruded_assymetric_hook(25,10,5, 5);


color("red")
extruded_hook(15,10,5);