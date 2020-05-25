$fn=100;

// Measurements
main_width = 22;
main_depth = 29.5;
main_height = 17;
axel_hole_radius = 12.5 /2;
bottom_extrusion_radius = 17 / 2;
bottom_extrusion_height = 3.4;
top_cut_out_radius = 24 / 2;
top_cut_out_depth = 4;
washer_support_height = 1;
washer_support_radius = 19 / 2;

union() {
    difference() {
        union() {
            // Main Body
            cube([main_width,main_depth, main_height], center=true);
            cylinder(h=main_height, r1=main_depth/2, r2=main_depth/2, center=true);
            
            // Bottom circular extrusion
            translate([0,0,-(main_height/2)-(bottom_extrusion_height/2)])
            cylinder(h=bottom_extrusion_height ,r1=bottom_extrusion_radius, r2=bottom_extrusion_radius, center=true);
            
        }
        
        // Top cutout for washer
        translate([0,0,(main_height/2)-(top_cut_out_depth/2)])
        cylinder(h=top_cut_out_depth, r1=top_cut_out_radius, r2=top_cut_out_radius, center=true);

        // Axel hole
        cylinder(h=main_height+(bottom_extrusion_height*2), r1=axel_hole_radius, r2=axel_hole_radius, center=true);
    }

    // Washer support in top cutout
    translate([0,0,(main_height/2)-(top_cut_out_depth)+(washer_support_height/2)])
    difference(){
    cylinder(h=washer_support_height, r1=washer_support_radius, r2=washer_support_radius, center=true);
    cylinder(h=washer_support_height, r1=washer_support_radius-washer_support_height, r2=washer_support_radius-washer_support_height, center=true);
    }

}