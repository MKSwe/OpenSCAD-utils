module arcPlacement(radius, angle){
	x = radius - radius*cos(angle);
	y = radius * sin(angle);
	translate([x,y,0]){
		rotate([0,0,-angle])children();
	}
}

module arc(angle, keys, spacing, offset=0,rotation=[0,90,0]){
	off=angle*offset;
	r = angle*(keys-1)+off;
	union(){
		rotate(rotation*-1){
			for(a = [off:angle:r]){
				arcPlacement(spacing, a) rotate(rotation)children();
			}
		}
	}
}


module DEMO(){
  color([1,0,0])arc(9,35,70)cube([10,10,2],center=true);
  
  
  color([0,1,0])translate([0,150,0])arc(9,35,70,0,[10,40,90])cube([10,10,2],center=true);
  
  color([0.8,0.1,0.4])translate([0,150,0])arc(9,35,70,0,[190,80,270])cube([10,10,2],center=true);

  color([0,0,1])
  translate([20,0,0])
  for(i=[1:1:70]){
    translate([i*2,0,0])arc(9,1,70,i)cube([10,10,2],center=true);
  }



  translate([-90,0,0]){
    color([1,1,0])arcPlacement(24,88)cube([10,20,30],center=true);
    color([0,1,1])arcPlacement(12,44)cube([10,20,3],center=true);
  }
}

DEMO();