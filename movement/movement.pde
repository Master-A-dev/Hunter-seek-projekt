Vehicle prey;
Vehicle hunter;


 PImage pic;

void setup(){
  frameRate(60);
fullScreen();

pic = loadImage("bunga.png");
pic.resize(98,110);
imageMode(CENTER);


hunter = new hunter(new PVector(random(1,1940),random(1,1080)));
prey = new prey(new PVector(random(width),random(height)), 6, 0.6);
}




void draw(){
background(0);

hunter.seek(prey);
hunter.update();
hunter.display();

prey.move();
prey.display();
prey.update();
}
