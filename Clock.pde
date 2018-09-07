TimeFrame[] timeFrames = {
  //Midnight
  new TimeFrame(0, 252),
  //1:00 AM
  new TimeFrame(1 * 60 * 60, 0),
  //2:00 AM
  new TimeFrame(1 * 60 * 60, 15),
  //3:00 AM
  new TimeFrame(1 * 60 * 60, 25),
  //4:00 AM
  new TimeFrame(1 * 60 * 60, 35),
  //5:00 AM
  new TimeFrame(1 * 60 * 60, 41),
  //6:00 AM
  new TimeFrame(6 * 60 * 60, 231),
  //7:00 AM
  new TimeFrame(7 * 60 * 60, 214),
  //8:00 AM
  new TimeFrame(8 * 60 * 60, 193),
  //9:00 AM
  new TimeFrame(9 * 60 * 60, 152),
  //10:00 AM
  new TimeFrame(10 * 60 * 60, 132),
  //11:00 AM
  new TimeFrame(11 * 60 * 60, 112),
  //12:00 PM
  new TimeFrame(12 * 60 * 60, 94),
  //1:00 PM
  new TimeFrame(13 * 60 * 60, 79),
  //2:00 PM
  new TimeFrame(14 * 60 * 60, 57),
  //3:00 PM
  new TimeFrame(15 * 60 * 60, 32),
  //4:00 PM
  new TimeFrame(16 * 60 * 60, 12),
  //5:00 PM
  new TimeFrame(17 * 60 * 60, 0),
  //6:00 PM
  new TimeFrame(18 * 60 * 60, 325),
  //7:00 PM
  new TimeFrame(19 * 60 * 60, 288),
  //8:00 PM
  new TimeFrame(20 * 60 * 60, 268),
  //9:00 PM
  new TimeFrame(21 * 60 * 60, 254),
  //10:00 PM
  new TimeFrame(22 * 60 * 60, 238),
  //11:00 PM
  new TimeFrame(23 * 60 * 60, 218),
};

int currentHue;
color currentColor;
int currentTime;

void setup() {
  size(1920, 1080, P2D);
  colorMode(HSB, 360, 100, 100);
  currentTime = second() + (minute() * 60) + (hour() * 60 * 60);
  int targetIndex = 0;
  for (int i = 0; i < timeFrames.length; i++) {
    if (timeFrames[i].time < currentTime) {
      targetIndex = i;
    }
  }
  //currentHue = int(lerp(float(timeFrames[targetIndex].hue), float(timeFrames[(targetIndex + 1 == timeFrames.length) ? 0 : targetIndex + 1].hue), map(currentTime, timeFrames[targetIndex].time, timeFrames[(targetIndex + 1 == timeFrames.length) ? 0 : targetIndex + 1].time, 0.0, 1.0)));
  currentColor = lerpColor(color(timeFrames[targetIndex].hue, 51.32, 88.78), color(timeFrames[(targetIndex + 1 == timeFrames.length) ? 0 : targetIndex + 1].hue, 51.32, 88.78), map(currentTime, timeFrames[targetIndex].time, timeFrames[(targetIndex + 1 == timeFrames.length) ? 0 : targetIndex + 1].time, 0.0, 1.0));
}

void draw() {
  translate(width / 2, height / 2);
  //println(currentHue);
  //background(currentHue, 67, 66);
  background(currentColor);
  currentTime = second() + (minute() * 60) + (hour() * 60 * 60);
  println(hue(currentColor));
  updateBackground();
  stroke(0, 0, 100);
  strokeWeight(10);
  noFill();
  ellipse(0, 0, width / 2, width / 2);
  pushMatrix();
  rotate(radians(180));
  rotate(radians(hour() * 30));
  line(0, 0, 0, width / 4 - 50);
  popMatrix();
}

void updateBackground() {
  int targetIndex = 0;
  for (int i = 0; i < timeFrames.length; i++) {
    if (timeFrames[i].time > currentTime) {
      targetIndex = i;
      break;
    }
  }
  println(targetIndex);
  println(hue(timeFrames[targetIndex].hue));
  //currentHue = int(lerp(float(currentHue), float(timeFrames[targetIndex].hue), map(currentTime, timeFrames[(targetIndex == 0) ? timeFrames.length - 1 : targetIndex - 1].time, timeFrames[targetIndex].time, 0.0, 1.0)));
  currentColor = lerpColor(currentColor, color(timeFrames[targetIndex].hue, 51.32, 88.78), map(currentTime, timeFrames[(targetIndex == 0) ? timeFrames.length - 1 : targetIndex - 1].time, timeFrames[targetIndex].time, 0.0, 1.0));
  //map(second() + (minute() * 60.0) + (hour() * 60.0 * 60.0), 0, 86400, 0, 360);
}
