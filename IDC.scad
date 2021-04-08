/* Simple IDC socket
 * 
 * Author: qwelyt (https://www.github.com/qwelyt/
 * License: CERN-OHL-S v2 (https://ohwr.org/cern_ohl_s_v2.txt)
 */
 
 /*[Probably don't touch]*/
space=2.54;

module housing(rows=2,cols=5){
  w=20.3;
  b=8.8;
  d=9;
  difference(){
    union(){
      cube([w,b,d],center=true);
      translate([0,b/2,0]){
        cube([0.7,0.6,d],center=true);
        translate([w/3,0,0])cube([0.7,0.6,9],center=true);
        translate([-w/3,0,0])cube([0.7,0.6,9],center=true);
      }
    }
    translate([0,0,2])cube([18.3,6.8,9],center=true);
    
    translate([20.3/2-4.4,0,3.1])rotate([0,0,45])cylinder(d1=1,d2=11.5,h=3,$fn=4,center=true);
    translate([-20.3/2+4.4,0,3.1])rotate([0,0,45])cylinder(d1=1,d2=11.5,h=3,$fn=4,center=true);
    translate([0,0,3.1])rotate([0,0,45])cylinder(d1=1,d2=11.5,h=3,$fn=4,center=true);
    
    translate([0,-8.8/2,2])cube([4.5,4.5,9],center=true);
    
    translate([20.3/2,0,-2.5])cube([2.01,3.3,9],center=true);
    translate([-20.3/2,0,-2.5])cube([2.01,3.3,9],center=true);
    
    x = true ? space*(cols-1)/2 : 0;
    y = true ? space*(rows-1)/2 : 0;
    translate([-x,-y,-9/2])repeate(rows,cols,space)cube([1.7,1.7,2],center=true);
  }
  
  translate([-w/6,b/2,0])rotate([-90,0,0])difference(){
    cube([6,3.1,0.01],center=true);
    
  linear_extrude(0.2)text(str(rows*cols, "P"),valign="center",halign="center",size=2);
  }
}

module repeate(x,y,space){
    union(){
    for(row=[0:1:x-1]){
      for(col=[0:1:y-1]){
        translate([space*col,space*row,0])children();
      }
    }
  }
}


module pin(){
  cube([0.65,0.65,11.3],center=true);
}

module pins(rows=2,cols=5,center=true){
  x = center ? space*(cols-1)/2 : 0;
  y = center ? space*(rows-1)/2 : 0;
  translate([-x,-y,0])repeate(rows,cols,space)pin();

}

module idc(rows=2,cols=5){
  housing(rows,cols);
  translate([0,0,-1.6])pins(rows,cols);
}

//translate([30,0,0])
//idc();

//pins();