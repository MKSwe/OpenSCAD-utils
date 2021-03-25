/* Demo of things in this repo
 * 
 * Author: qwelyt (https://www.github.com/qwelyt/
 * License: CERN-OHL-S v2 (https://ohwr.org/cern_ohl_s_v2.txt)
 */
include<pinHeader.scad>
include<socket.scad>
include<proMicro.scad>

demoSize=15;

module combo(){
  translate([7.5,0,2.3])pinHeader(12);
  translate([-7.5,0,2.3])pinHeader(12);
  proMicro();
  translate([0,0,-2.3])socket(12);
}


module socketDemo(num){
  for(i = [1:1:num]){
    translate([20*(i-1),0,0])socket(i);
  }
}
module pinHeaderDemo(num){
  for(i = [1:1:num]){
    translate([10*(i-1),0,0])pinHeader(i);
  }
}

module proMicroDemo(){
  proMicro();
}

translate([-demoSize*15/2,-40,0])pinHeaderDemo(demoSize);
rotate([0,0,90])proMicroDemo();
translate([-50,0,0])rotate([0,0,90])combo();
translate([-(demoSize*20)/2,50,0])socketDemo(demoSize);
