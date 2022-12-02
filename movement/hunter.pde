class hunter extends Vehicle{

  hunter(PVector _p) {
    position = _p;
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
    s = 3.0;
    maxforce = 0.3;
    maxspeed = 6;
  }
  
  hunter(PVector _p, float _maxspeed){
  position = _p;
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
    s = 3.0;
    maxforce = 0.1;
    maxspeed = _maxspeed;
  }
  
 void seek(Vehicle target) {
   PVector desired = PVector.sub(target.position, position);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    applyForce(steer);
  }

 void display() {
 image(pic,position.x,position.y);
 }


}
