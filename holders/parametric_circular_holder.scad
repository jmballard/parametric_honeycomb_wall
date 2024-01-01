// libraries to import
include <BOSL2/std.scad>
include <BOSL2/rounding.scad> // for rounding the holder
include <hex plug library.scad> // for the HSW hooks, from https://www.printables.com/model/260073-openscad-library-for-hsw-attachments

/* [Global Parameters] */
// diameter of the circular object
diameter_object = 71 ;// [10:150]
// depth of the object
depth_object = 26; // [5:50]
// anchor place
anchor = "bottom" ;// ["bottom", "center"]


module holder(rad,depth, thickness,tr){
    difference() {
    
        translate([0,0,tr])
        rotate([-90,0,0])
        linear_extrude(height=depth + 2 * thickness, scale = [1,1]) {
              circle(rad + thickness, $fn=96);
        };
        
        translate([0,thickness,tr])
        rotate([-90,0,0])
        linear_extrude(height=depth, scale = [1,1]) {
              circle(rad, $fn=96);
        };
        
        translate([0,depth/2 + 2 * thickness,tr+rad])
        cuboid([2 * rad + 2 * thickness,depth + 2 * thickness,rad*2]);
    }
}


module circular_holder() {
    /* 
    This module creates a circular holder with 1 insert to the HSW
    */
        
    // the HSW insert
    insert_horizontal();
    
    // The holder itself
    if (anchor == "bottom"){
        holder(diameter_object/2,depth_object,thickness=2,tr=diameter_object/2);
    }
    else{
        holder(diameter_object/2,depth_object,thickness=2,tr=10);
    }
}

circular_holder();