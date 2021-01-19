$fa = 1;
$fs = 0.4;


module batman_arrow(main_rod_length = 55.5, main_rod_diameter = 4, slit_top_distance = 14) {
    // Calculated variables
    main_rod_radius = main_rod_diameter / 2;
    track_offset_from_top = main_rod_length * 0.144144144;
    track_depth = main_rod_diameter * 0.425; // 1.72
    track_width = main_rod_diameter * 1.75; // 7
    track_height = main_rod_length - main_rod_radius - track_offset_from_top;

    top_track_width = (main_rod_diameter / 2) + 1;

    cone_height = main_rod_length * 0.2;
    cone_r1 = track_width;
    cone_r2 = cone_r1 * 0.51;
    
    // Adjust to center point
    translate([0,0,+(cone_height/2)-main_rod_radius])
    difference() {
        union() {
            // Main Rod with rounded tops
            cylinder(h=main_rod_length - main_rod_radius, r1=main_rod_radius, r2=main_rod_radius, center=true);
            translate([0,0, (main_rod_length - main_rod_radius) / 2])
                sphere(r=main_rod_radius);
            
            // Dual "slide track"
            translate([0,0,-(track_offset_from_top / 2)])
                cube([track_depth, track_width, track_height], center=true);
            
            // Top "slide track"
            translate([top_track_width / 2, 0,-(track_offset_from_top / 2)])
                cube([top_track_width, track_depth, track_height], center=true);
            
            // Bottom cone
            translate([0,0, -((main_rod_length - main_rod_radius) / 2) - (cone_height/2) + 0.0001])
                cylinder(h=cone_height, r1=cone_r1, r2=cone_r2, center=true);
        }
        translate([3 + 0.0001 ,0,((main_rod_length - main_rod_radius) / 2) - slit_top_distance]) {
            rotate([270,0,180]) {
                linear_extrude(height = track_width, center = true)
                    polygon([[0,0],[2,0],[0,7]], paths=[[0,1,2]]);
            }
        }
    }
    
}

batman_arrow(main_rod_length = 55.5, main_rod_diameter = 4, slit_top_distance = 17);

