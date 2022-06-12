$fn=50;

// General
part="all";
release_version="";
tol=0.15;
press_fit_tol=0.1;
wall_thickness=0.9;
base_thickness=1.2;
text_depth=0.5;

// Case settings
height=82;  // height of the hole case measured from the center of the mounting screw holes
fillet_radius=3;
rim_thickness=2;
rim_height=10;
screw_hole_dia=3;
screw_hole_center_to_post_top = 3.5;
screw_length=10;
nut_thickness=2.4;

// PCB Settings
pcb_thickness=1.6;
pcb_top_depth=10.5;  // space in the case on the top side of the pcb
pcb_bottom_depth=max(2.5, nut_thickness);  // space in the case on the bottom side of the pcb
pcb_width=23.1;
mount_center_from_edge_1=6.1;  // distance to center of left mounting hole when viewed from the top
mount_center_from_edge_2=6.1;  // distance to center of right mounting hole when viewed from the top
post_width = 8.3;  // width of the mounting posts
post_height = 10;  // height of the mounting posts
post_depth = max(5, screw_length - pcb_bottom_depth - pcb_thickness - 2 * tol);

// helper variables
inner_width=pcb_width + 2 * tol;
inner_depth=pcb_top_depth + pcb_bottom_depth + pcb_thickness + 2 * tol;
total_width=inner_width + 2 * wall_thickness + 2 * press_fit_tol + 2 * rim_thickness;
total_depth=inner_depth + 2 * wall_thickness + 2 * press_fit_tol + 2 * rim_thickness;

lock_edge_depth=0.4;
lock_edge_length=inner_depth + 2 * rim_thickness - 2 * (fillet_radius - wall_thickness + press_fit_tol) - 3;

// Locking Edge
module lock_edge(depth=lock_edge_depth, length=lock_edge_length){
    translate([0, -length / 2, depth]) rotate([-90, 0, 0]) linear_extrude(length)
        polygon(points = [[0,0], [depth, depth], [0, 2 * depth]]);
}

// Mount Post
// `pos` is center of bottom front edge
module mounting_post(
    pos=[0, 0, 0],
    width=post_width,
    depth=post_depth,
    height=post_height,
){
    translate(pos - [width / 2, 0, 0])
        difference(){
            cube([width, depth, height]);
            translate([width / 2, -tol, height - screw_hole_center_to_post_top])
                rotate([-90, 0, 0])
                    cylinder(h=depth + 2 * tol, d=screw_hole_dia + 2 * tol);
        };
}

// Base
if(part == "base" || part == "all"){
    union(){
        difference(){
            linear_extrude(base_thickness) difference(){
                offset(r=fillet_radius) offset(r=-fillet_radius)
                    square(
                            [
                                total_width,
                                total_depth,
                            ],
                            center=true
                        );
                    translate([0, wall_thickness + press_fit_tol + rim_thickness + pcb_bottom_depth])
                        translate([0, -total_depth / 2, 0])
                            translate([0, (pcb_thickness + 2 * tol) / 2])
                                square([pcb_width + 2 * tol, pcb_thickness + 2 * tol], center=true);
            };
            translate([0, total_depth / 2 - (wall_thickness + press_fit_tol + rim_thickness + pcb_top_depth) / 2, text_depth]) rotate([180, 0, 0])
                   linear_extrude(text_depth + 0.1) text(text=release_version, size=max(pcb_top_depth - 4, 4), halign="center", valign="center");
        };
        // Rim
        translate([0, 0, base_thickness])
            difference(){
                linear_extrude(rim_height)
                    difference(){
                        offset(r=(fillet_radius - wall_thickness + press_fit_tol)) offset(r=-(fillet_radius - wall_thickness + press_fit_tol))
                            square([inner_width + 2 * rim_thickness, inner_depth + 2 * rim_thickness], center=true);
                        square([inner_width, inner_depth], center=true);
                    };
                translate([0, 0, max(post_height - screw_hole_center_to_post_top - 3.5, 0)])
                    linear_extrude(height=screw_hole_center_to_post_top + 3.5 + 0.1)
                        square(
                            [
                                pcb_width - ((mount_center_from_edge_1 - post_width / 2) + (mount_center_from_edge_2 - post_width / 2)) + 1,
                                inner_depth + 2 * rim_thickness + 0.1
                            ],
                            center=true
                        );
                translate([inner_width / 2 + rim_thickness, 0, rim_height / 2]) rotate([0, 180, 0]) lock_edge(depth=lock_edge_depth + tol);
                translate([- (inner_width / 2 + rim_thickness), 0, rim_height / 2]) lock_edge(depth=lock_edge_depth + tol);
            }
    };
    mounting_post([
        -pcb_width / 2 + mount_center_from_edge_1,
        -total_depth / 2 + wall_thickness + press_fit_tol + rim_thickness + pcb_bottom_depth + pcb_thickness + 2 * tol,
        base_thickness
    ]);
    mounting_post([
        pcb_width / 2 - mount_center_from_edge_2,
        -total_depth / 2 + wall_thickness + press_fit_tol + rim_thickness + pcb_bottom_depth + pcb_thickness + 2 * tol,
        base_thickness
    ]);
}



// Shell
if(part == "shell" || part == "all"){
    translate([total_width + 1, 0, base_thickness + wall_thickness + tol + height + (post_height - screw_hole_center_to_post_top)])
        rotate([180, 0, 0])
            difference(){
                union(){
                    translate([0, 0, base_thickness + tol]) union(){
                        linear_extrude(height + (post_height - screw_hole_center_to_post_top)) difference(){
                            offset(r=fillet_radius) offset(r=-fillet_radius) square([total_width, total_depth], center=true);
                            offset(r=(fillet_radius - wall_thickness)) offset(r=-(fillet_radius - wall_thickness))
                                square([total_width - 2 * wall_thickness, total_depth - 2 * wall_thickness], center=true);
                        };
                        translate([-inner_width / 2 - rim_thickness - press_fit_tol, 0, rim_height / 2 + tol])
                            lock_edge(length=lock_edge_length - 2 * tol);
                        translate([+inner_width / 2 + rim_thickness + press_fit_tol, 0, rim_height / 2 + tol]) rotate([0, 180, 0])
                            lock_edge(length=lock_edge_length - 2 * tol);
                    };
                    translate([0, 0, base_thickness + tol + height + (post_height - screw_hole_center_to_post_top)])
                        linear_extrude(wall_thickness)
                            offset(r=fillet_radius) offset(r=-fillet_radius) square([total_width, total_depth], center=true);
                };
                translate(
                    [
                        0,
                        0,
                        base_thickness + tol + height + (post_height - screw_hole_center_to_post_top) + min(text_depth, wall_thickness / 2)
                    ]
                )
                    rotate([180, 0, 0])
                        linear_extrude(text_depth + 0.1) text(text=release_version, size=pcb_top_depth - 3, halign="center", valign="center");
            };
}
