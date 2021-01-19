$fn=100;

main_rod_diameter = 4;
base_height = 55.5;
top_clearance = 8;

main_rod_height = base_height-(main_rod_diameter / 2);

main_rod_radius = main_rod_diameter / 2;
main_rod_top_z = main_rod_height / 2;

target_cylinder_height = 10;
target_cylinder_r1 = 7;
target_cylinder_r2 = 3.5;



union() {
    difference() {
        union() {
            // Main rod
            cylinder(h=main_rod_height, r1=main_rod_radius, r2=main_rod_radius, center=true);

            // Top rounding
            translate([0,0,main_rod_top_z])
                sphere(r=main_rod_radius);

            translate([0,0,-4]) 
                cube([1.72,7,base_height-top_clearance], center=true);

            translate([1.25,0,-4])     
                cube([2.5,1.7,base_height-top_clearance], center=true);

            translate([0,0,-main_rod_top_z-(target_cylinder_height/2)])
                cylinder(h=target_cylinder_height, r1=target_cylinder_r1, r2=target_cylinder_r2, center=true);
            
        }
        
        translate([2.5,0,main_rod_top_z-15]) {
            rotate([270,0,180]) {
                linear_extrude(height = 7, center = true)
                    polygon([[0,0],[1.64,0],[0,6.79]], paths=[[0,1,2]]);
            }
        }
    }
}           