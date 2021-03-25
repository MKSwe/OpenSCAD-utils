/* A simple utility to create pin headers. Input how
 * many pins you want and if you want to center the
 * header. You could also mess with the spacing of the
 * pins, but 2.54mm is pretty standard.
 * 
 * Author: qwelyt (https://www.github.com/qwelyt/
 * License: CERN-OHL-S v2 (https://ohwr.org/cern_ohl_s_v2.txt)
 */

/*[Pins]*/
pins=12;
center=true;
/*[Probably don't touch]*/
space=2.54;
$fn=60;

module roundedCube(size=[1,1,1], center=false, r=0.5){
  tMin = r;
  txMax = size[0] - r;
  tyMax = size[1] - r;
  tzMax = size[2] - r;
  
  cent = center ? [-(txMax/2+r/2),-(tyMax/2+r/2),-(tzMax/2+r/2)] : [0,0,0];
  
  translate(cent)  
  hull(){
    translate([tMin,tMin,tMin])sphere(r=r);
    translate([tMin,tMin,tzMax])sphere(r=r);
    

    translate([txMax,tMin,tMin])sphere(r=r);
    translate([txMax,tMin,tzMax])sphere(r=r);
    
    
    translate([tMin,tyMax,tMin])sphere(r=r);
    translate([tMin,tyMax,tzMax])sphere(r=r);
    
    translate([txMax,tyMax,tMin])sphere(r=r);
    translate([txMax,tyMax,tzMax])sphere(r=r);
    
  }
}

module pin(){
  w=space+0.02;
  roundedCube([w,w,w],center=true,r=0.3);
  
  translate([0,0,space/2])cube([0.6,0.6,11.2],center=true);
  
}

module pinHeader(pins=12, center=true){
  c = center ? space*(pins-1)/2 : 0;
  translate([0,-c,0])
  union(){
    for(p = [0:1:pins-1]){
      translate([0,p*space,0])pin();
    }
  }
}