side_length = 15;
side_depth = 2;
oct_alter_length = sqrt((side_length*side_length)/2);
inner_tri_side = ((side_length*sin(60))-side_depth-(side_depth/cos(60)))/sin(60);

module square_face() {
    difference() {
        cube([side_length, side_length, side_depth]);
        translate([side_depth, side_depth, 0]) cube([side_length-(2*side_depth), side_length-(2*side_depth), side_depth]);
        }};

module triangle_face() {
    linear_extrude(side_depth)
    difference() {
        polygon([[0,0],[0,side_length],[sin(60)*        side_length,side_length/2]]);
        translate([side_depth,(side_length-inner_tri_side)/2,0]) polygon([[0,0],[0,inner_tri_side],[sin(60)*inner_tri_side,inner_tri_side/2]]);
}};


module centre_part() {      
square_face();
translate([0,side_length,0]) rotate ([45,0,0]) square_face();
translate([0,oct_alter_length+side_length,oct_alter_length]) rotate ([90,0,0]) square_face();
translate([0,oct_alter_length+side_length,oct_alter_length+side_length]) rotate ([135,0,0]) square_face();
translate([0,side_length,(oct_alter_length*2)+side_length]) rotate ([180,0,0]) square_face();
translate([0,0,(oct_alter_length*2)+side_length]) rotate ([225,0,0]) square_face();
translate([0,-oct_alter_length,oct_alter_length+side_length]) rotate ([270,0,0]) square_face();
translate([0,-oct_alter_length,oct_alter_length]) rotate ([315,0,0]) square_face();
}

//centre_part();

module top_part() {
square_face();
translate([0,side_length,0]) rotate ([45,0,0]) square_face();
translate([0,-oct_alter_length,oct_alter_length]) rotate ([315,0,0]) square_face();
translate([-oct_alter_length,0,oct_alter_length]) rotate ([0,45,0]) square_face();
translate([side_length,0,0]) rotate ([0,315,0]) square_face();
   translate([0,-oct_alter_length,oct_alter_length]) rotate([0,55,45]) triangle_face();
translate([side_length,0,0]) rotate ([0,315,0]) square_face();
translate([-oct_alter_length,side_length,oct_alter_length]) rotate([0,55,315]) triangle_face();
translate([side_length,0,0]) rotate ([0,315,0]) square_face();
translate([side_length+oct_alter_length,0,oct_alter_length]) rotate([0,55,135]) triangle_face();
translate([side_length,side_length+oct_alter_length,oct_alter_length]) rotate([0,55,225]) triangle_face();
}



translate([-oct_alter_length,0,oct_alter_length+side_length]) rotate([0,90,0])centre_part();
top_part();
translate([-oct_alter_length*0.3,oct_alter_length*0.7,side_length+(oct_alter_length*2)]) rotate([180,0,45]) top_part();
