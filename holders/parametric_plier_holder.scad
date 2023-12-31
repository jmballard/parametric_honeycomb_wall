// libraries to import
include <BOSL2/std.scad>
include <BOSL2/rounding.scad> // for rounding the holder
include <hex plug library.scad> // for the HSW hooks, from https://www.printables.com/model/260073-openscad-library-for-hsw-attachments

/* [Global Parameters] */
// width of the plier holder (inside)
width_holder = 40; // [80]
// length of the plier holder (inside)
length_holder = 80; // [150]
// height of the plier holder
height_holder = 25; // [22:80]
// thickness of the plier holder
thickness_holder = 3; // [1:10]
// angle holder on the left & right - in degree
angle_holder = 60; // [10:90]



module plier_holder() {
    /* 
    This module creates a plier holder with 1 insert to the HSW
    */
    
    total_length = length_holder + 2 * thickness_holder;
    total_width = width_holder + 2 * thickness_holder;
    
    // calculate scales so that the angles are at angle_holder degree
    corrected_angle = max(min(angle_holder, 90),10);
    scale_15_ext = height_holder / (tan(corrected_angle) * total_length) + 1;
    scale_15_int = height_holder / (tan(corrected_angle) * length_holder) + 1;
    
    difference() {
        union() {            
            // the HSW insert
            insert_horizontal();
            
            // The holder itself
            translate([0,total_width/2,0])
            linear_extrude(height=height_holder, scale = [scale_15_ext,1]) {
                  polygon(round_corners(rect([total_length, total_width]), cut=2, $fn=96));
            }
        }
        // the empty inside of the holder
        translate([0,total_width/2,-1])
        linear_extrude(height=height_holder+2, scale = [scale_15_int,1]) {
              polygon(round_corners(rect([length_holder, width_holder]), cut=2, $fn=96));
        }
    }
}

plier_holder();