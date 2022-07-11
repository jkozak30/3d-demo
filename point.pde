class Point {
  
  //my transformations
  //x : (x, y, z) |-> (  x,   ycos@-zsin@,   ysin@+zcos@  )
  //y : (x, y, z) |-> (  zsin@+xcos@,   y,   zcos@-xsin@  )
  //z : (x, y, z) |-> (  xcos@-ysin@,   xsin@+ycos@,   z  )
  //final: (x, y, z) |-> (  20*x+200,   20*y+200  )
  float x, y, z;
  
  
  Point(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  float[] mapTo() {
    float retx, rety, retz;
    float[] ret = new float[2];
    float oldx = x; float oldy = y; float oldz = z;
    // x :
    retx = oldx;
    rety = oldy*cos(xang*PI/180.0)-oldz*sin(xang*PI/180.0);
    retz = oldy*sin(xang*PI/180.0)+oldz*cos(xang*PI/180.0);
    oldx = retx; oldy = rety; oldz = retz;
    // y :
    retx = oldz*sin(yang*PI/180.0)+oldx*cos(yang*PI/180.0);
    rety = oldy;
    retz = oldz*cos(yang*PI/180.0)-oldx*sin(yang*PI/180.0);
    oldx = retx; oldy = rety; oldz = retz;
    // z :
    retx = oldx*cos(zang*PI/180.0)-oldy*sin(zang*PI/180.0);
    rety = oldx*sin(zang*PI/180.0)+oldy*cos(zang*PI/180.0);
    retz = oldz;
    ret[0] = 20*retx+200; ret[1] = 20*rety+200;
    return ret;
  }
  
  void draw() {
    float[] coords = this.mapTo();
    //println(coords[0]);
    ellipse(coords[0], coords[1], 5, 5);
  }
}
