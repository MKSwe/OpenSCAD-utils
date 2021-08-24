module rcube(size=[1,1,1],topSize=[],center=false,r=1){
  module sp(){
    if(r <= 0){
      cube([0.01,0.01,0.01],center=true);
    } else {
      sphere(r=r);
    }
  }
  tS = len(topSize) == 0 ? [size[0],size[1]] 
        : len(topSize) == 1 ? [topSize[0], size[1]] 
        : [topSize[0],topSize[1]];
  
  tx=size[0] - r;
  ty=size[1] - r;
  tz=size[2] - r;
  ttx=(tS[0] - r);
  tty=(tS[1] - r);


  cntr = center ? [-(tx/2+r/2),-(ty/2+r/2), -(tz/2+r/2)] : [0,0,0];

  translate(cntr)
  hull(){

    //bottom
    translate([r,r,r])sp();
    translate([tx,r,r])sp();
    translate([r,ty,r])sp();
    translate([tx,ty,r])sp();
    
    //top
    translate([-((ttx-tx)/2),-((tty-ty)/2),0]){
      translate([r,r,tz])sp();
      translate([ttx,r,tz])sp();
      translate([r,tty,tz])sp();
      translate([ttx,tty,tz])sp();
    }
  }
}

rcube([10,20,30],[40,50],r=0);