// libraries to import
include <BOSL2/std.scad>
include <BOSL2/rounding.scad> // for rounding the holder
include <hex plug library.scad> // for the HSW hooks, from https://www.printables.com/model/260073-openscad-library-for-hsw-attachments

/* [Global Parameters] */
//width of the hook
width_hook = 5; //[4:18]
//depth of the hook
depth_hook = 20; // [40]
//height of the hook
height_hook = 10 ; // [25]
// thickness of the hook
thickness_hook = 2; // [10]


module hook() {
    /* 
    This module creates a plier holder with 1 insert to the HSW
    */
    union() {
        // the HSW insert
        insert_horizontal();
        
        scale = height_hook / (tan(60) * depth_hook) + 1;
        
        difference() {
            // The holder itself
            translate([0,depth_hook/2,0])
            linear_extrude(height=height_hook, scale = [1,scale]) {
                  rect([width_hook, depth_hook]);
            };
            
            // The holder itself
            translate([-1,depth_hook/2 - thickness_hook,thickness_hook])
            linear_extrude(height=height_hook, scale = [1,scale]) {
                  rect([width_hook+3, depth_hook]);
            };
            
            translate([0,-depth_hook/2,0])
            linear_extrude(height=height_hook, scale = [1,1]) {
                  rect([width_hook, depth_hook]);
            }
        }
    }
    
}

hook();




