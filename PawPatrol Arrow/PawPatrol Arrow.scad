$fa = 1;
$fs = 0.4;


module pawpatrol_arrow() {
    cylinder1_height = 17;
    cylinder2_height = 13;
    cylinder3_height = 4.8;
    cylinder4_height = 16;
    cylinder1_diameter = 6.5;
    cylinder2_diameter = 5;
    cylinder3_diameter = 3.5;
    cylinder4_diameter = cylinder2_diameter;
    cone_height = 15;
    overlap = 0.0001;


    translate([0,0,(cylinder1_height/2)+cone_height])
    union() {
        cylinder(cylinder1_height, r=cylinder1_diameter/2, center=true);

        translate([0,0,(cylinder1_height/2)+(cylinder2_height/2)-overlap])
            cylinder(cylinder2_height, r=cylinder2_diameter/2, center=true);
            
        translate([0,0,(cylinder1_height/2)+(cylinder2_height)+(cylinder3_height/2)-overlap])
            cylinder(cylinder3_height, r=cylinder3_diameter/2, center=true);
            
        translate([0,0,(cylinder1_height/2)+(cylinder2_height)+(cylinder3_height)+((cylinder4_height-(cylinder4_diameter/2))/2)-overlap])
            cylinder(cylinder4_height-(cylinder4_diameter/2), r=cylinder4_diameter/2, center=true);
            
        translate([0,0,(cylinder1_height/2)+(cylinder2_height)+(cylinder3_height)+((cylinder4_height-(cylinder4_diameter/2)))-overlap])
            sphere(cylinder4_diameter/2);
            
        translate([0,0,-(cylinder1_height/2)-(cone_height/2)+overlap])
            cylinder(h=cone_height, r1=cylinder1_diameter, r2=cylinder1_diameter/2, center=true);
    }
}

pawpatrol_arrow();

