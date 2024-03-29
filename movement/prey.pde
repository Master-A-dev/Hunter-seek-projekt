class prey extends Vehicle{

  
  prey(PVector _p,float _maxspeed, float _maxforce, float _range){
    position = _p;
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
    size = 3;
    maxforce = _maxforce;
    maxspeed = _maxspeed;
    oldspeed = _maxspeed;
    range = _range;
    desired = new PVector(width/2, height/2);
    timer = millis();
    counter = 500;
    
  }
  
  void move(Vehicle _target){

    if ((position.x > width) || (position.x < 0)) {  //border on x
      vel.x = vel.x * -1;
      desired.x *= -1;
    }
    else if ((position.y > height) || (position.y < 0)) {  //border on y
      vel.y = vel.y * -1;
      desired.y *= -1;
    }
    else if (dist(position.x, position.y, _target.position.x, _target.position.y) < range) { 
      flee(_target);
<<<<<<< HEAD
      maxspeed *= 1.06; //Makes the pray move faster when it flees
=======
      maxspeed *= 1.1; 
>>>>>>> afd75f12401c823c67ae978f211a7cb6136fc9e2
    } 
     else if (millis() - timer > counter) {   
      wander();
      timer = millis();
    }
   
    
   if (dist(position.x, position.y, _target.position.x, _target.position.y) > _target.range*2) { 
     maxspeed = oldspeed;
     
    }
  
 PVector steer = PVector.sub(desired, vel);  //makes the animal move
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  void flee(Vehicle _target) {
    desired = PVector.sub(_target.position, position).mult(-1);
    desired.normalize();
    desired.mult(maxspeed);
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
    vertex(0, -size*4);
    vertex(-size*2, size*4);
    vertex(size*2, size*4);
    endShape(CLOSE);
    popMatrix(); 
  }
}
