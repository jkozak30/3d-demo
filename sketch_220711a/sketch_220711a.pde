Point o = new Point(0, 0, 0);
Point x = new Point(100, 0, 0);
Point y = new Point(0, 100, 0);
Point z = new Point(0, 0, 100);
//Point p;
float xang, yang, zang;

// demo time
Point p1 = new Point(1, 1, 1);
Point p2 = new Point(1, 1, 2);
Point p3 = new Point(1, 2, 1);
Point p4 = new Point(2, 1, 1);
Point p5 = new Point(1, 2, 2);
Point p6 = new Point(2, 1, 2);
Point p7 = new Point(2, 2, 1);
Point p8 = new Point(2, 2, 2);


void connect(Point p1, Point p2) {
  float[] c1 = p1.mapTo();
  float[] c2 = p2.mapTo();
  line(c1[0], c1[1], c2[0], c2[1]);
}

void setup() {
  size(400, 400);
  xang = 195;
  yang = 20;
  zang = 5;
  //p = new Point(1, 1, 1);
}

void drawAxes() {
  float[] origin = o.mapTo();
  float[] xc = x.mapTo();
  float[] yc = y.mapTo();
  float[] zc = z.mapTo();
  stroke(255, 0, 0);
  line(origin[0], origin[1], xc[0], xc[1]);
  stroke(0, 255, 0);
  line(origin[0], origin[1], yc[0], yc[1]);
  stroke(0, 0, 255);
  line(origin[0], origin[1], zc[0], zc[1]);
  stroke(0);
}

void draw() {
  background(204, 204, 204);
  drawAxes();
  o.draw();
  //p.draw();
  p1.draw(); p2.draw(); p3.draw(); p4.draw(); p5.draw(); p6.draw(); p7.draw(); p8.draw();
  connect(p1, p2); connect(p1, p3); connect(p1, p4);
  connect(p2, p5); connect(p2, p6);
  connect(p3, p5); connect(p3, p7);
  connect(p4, p6); connect(p4, p7);
  connect(p5, p8);
  connect(p6, p8);
  connect(p7, p8);
  //println("xang: " + xang + " yang: " + yang + " zang: " + zang);
}

void keyPressed() {
  if (key == 'w') { // ws for x rotation
    xang+=5;
  } else if (key == 's') {
    xang-=5;
  }
  if (key == 'd') { // ad for y rotation
    yang+=5;
  } else if (key == 'a') {
    yang-=5;
  }
  
  if (keyCode == LEFT) { //leftright for z rotation
    zang+=5;
  } else if (keyCode == RIGHT) {
    zang-=5;
  }
}
