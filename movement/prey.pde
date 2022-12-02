class prey extends Vehicle{

  
  prey(PVector _p,float _maxspeed, float _maxforce){
  position = _p;
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
    s = 3;
    maxforce = _maxforce;
    maxspeed = _maxspeed;
    desired = new PVector(width/2, height/2);
  }
  void move(){
 

    if ((position.x > width) || (position.x < 0)) {  //border on x
      vel.x = vel.x * -1;
      desired.x *= -1;
    }
    else if ((position.y > height) || (position.y < 0)) {  //border on y
      vel.y = vel.y * -1;
      desired.y *= -1;
    }
    else
    wander();
  
 PVector steer = PVector.sub(desired, vel);  //makes the animal move
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  void wander() {    //makes the target move to a new point via polar vectors
    float r = 20.5;
    float x = r*cos(random(360));
    float y = r*sin(random(360));
    
    desired.sub(new PVector(x, y));
    desired.normalize();
    desired.mult(maxspeed);
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
    vertex(0, -s*4);
    vertex(-s*2, s*4);
    vertex(s*2, s*4);
    endShape(CLOSE);
    popMatrix(); 
  }
}
