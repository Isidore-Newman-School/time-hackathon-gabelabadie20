float angle = 0;
PImage sunTexture;
PShape sun;
float cameraZoom;
float scrollSensitivity = 5;

void setup() {
  sunTexture = loadImage("8k_sun.jpg");
  sun = createShape(SPHERE, 300);
  sun.setTexture(sunTexture);
  size(1920, 1080, P3D);
}

void draw() {
  updateSky();
  updateClock();
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0) + cameraZoom, width/2.0, height/2.0, 0, 0, 1, 0);
  lights();
  updateSphere();
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  cameraZoom += (Math.signum(e) * scrollSensitivity);
}

void updateSky() {
  background(0, 0, 0);
}

void updateClock() {
  textSize(100);
  textAlign(CENTER, CENTER);  
  fill(0, 0, 0);
  stroke(255, 255, 255);
  for(int x = -1; x < 2; x++){
    fill(255, 255, 255);
    text(hour() + ":" + minute() + ":" + second(), (width / 2)+x, (height / 2));
    text(hour() + ":" + minute() + ":" + second(), (width / 2), (height / 2)+x);
  }
  fill(0, 0, 0);
  text(hour() + ":" + minute() + ":" + second(), (width / 2), (height / 2));
}

void updateSphere() {
  translate(width / 2, height / 2, 0);
  angle += 0.1;
  rotateY(radians(angle));
  noStroke();
  //ambient(255, 140, 0);
  //emissive(253, 184, 19);
  shape(sun);
}
