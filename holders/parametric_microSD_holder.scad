// libraries to import
include <BOSL2/std.scad>
include <BOSL2/rounding.scad> // for rounding the holder
include <hex plug library.scad> // for the HSW hooks, from https://www.printables.com/model/260073-openscad-library-for-hsw-attachments

/* [Global Parameters] */
// number of micro SD cards
microsd = 7; // [1:10]

module microsd_holder() {
    /* 
    This module creates a holder for micro SD cards with 1 insert to the HSW
    */
    
    
    insert_horizontal();
    
    // size of one face of the hexagon
    size_hexagon = 12;

    // height of the equilateral triangles of the hegaxon
    height_triangle = sqrt(3 / 4 * size_hexagon^2);
    
    length_holder = 4 * microsd + 6;

    difference(){
        // the holder
        rotate([90,0,0])
        translate([0,height_triangle,-length_holder])
        linear_extrude(height=length_holder, scale = [1,1]) {
            hexagon(size_hexagon);
        };
        
        // sd slots
        for (i = [0:microsd]){
            translate([0,4 * i + 3,20])
            cuboid([10,2,10]);
        }
    }
}


microsd_holder();
