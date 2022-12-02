abstract class Vehicle {

  PVector position;
  PVector acc;
  PVector vel;
  PVector desired;
  float maxspeed;
  float maxforce;
  float s;



void update() {
    vel.add(acc);
    vel.limit(maxspeed);
    position.add(vel);
    acc.mult(0);
  }


  void seek(Vehicle target) {}
  void move(){}
  
  
  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void movement(){}
  
  void display() {}
   
  void wander(){}
  
}
