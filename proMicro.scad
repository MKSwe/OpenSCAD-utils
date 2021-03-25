/* A simple model of a pro micro
 *
 * Author:  qwelyt (https://www.github.com/qwelyt/
 * License: CERN-OHL-S v2 (https://ohwr.org/cern_ohl_s_v2.txt)
 */

module holes(){
    for (i=[0:11]) {
        translate([0, (2.54*i), 0])
        cylinder(d=1, h=10, center=true, $fn=30);
    }
}

module proMicro(){
  translate([0,1.5,0])union(){
    difference(){
      cube([18, 33, 1.5],center=true);
      translate([18/2-1.5,-33/2+1,0])holes();
      translate([-18/2+1.5,-33/2+1,0])holes();
    }
    
    translate([0,33/2,1.5])difference(){
      cube([7, 6, 2], center=true);
      translate([0,1,0])cube([6, 5, 1], center=true);
    }
    translate([0,33/4,1.5])cube([11,3,1.5],center=true);
    translate([0,-33/9,1])cube([11,11,1.5],center=true);
    translate([0,-33/2.7,1])cube([11,3,1.5],center=true);
  }
}