abstract class Vehicle {

  PVector position;
  PVector acc;
  PVector vel;
  float maxspeed;
  float maxforce;
  float r;



void update() {
    vel.add(acc);
    vel.limit(maxspeed);
    position.add(vel);
    acc.mult(0);
  }


  void seek(Vehicle target) {}
  
  
  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void movement(){}
  
  
   void display() {}
  
}
