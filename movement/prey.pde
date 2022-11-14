class prey extends Vehicle{

  
  prey(PVector _p) {
    position = _p;
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
    r = 3.0;
    maxforce = 0.3;
    maxspeed = 6;
  }
  
  prey(PVector _p, float _maxspeed){
  position = _p;
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
    r = 3.0;
    maxforce = 0.1;
    maxspeed = _maxspeed;
  }
  void movement(){
    
   
  if (position. x > 25) {
  PVector desired = new PVector(maxspeed,vel.y);
  PVector steer = PVector.sub(desired, vel);
  steer.limit(maxforce);
  applyForce(steer);
}
  }
   void display() {
  //Vehicle is a triangle pointing in the direction of velocity; since it is drawn pointing up, we rotate it an additional 90 degrees.
   float theta = vel.heading() + PI/2;
    fill(175);
    stroke(0);
    pushMatrix();
    translate(position.x,position.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*4);
    vertex(-r*2, r*4);
    vertex(r*2, r*4);
    endShape(CLOSE);
    popMatrix(); 
  }
  
}
