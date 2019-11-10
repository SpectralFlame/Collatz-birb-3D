import peasy.*;

PeasyCam cam;

// max value
int N = 20000;

// length of line segment
int L = 7;
// width of line
float W = L*0.5;

// list holding the number chains
ArrayList<IntList> chains;

// red
float r = 192;
float rvar = 40;
float rmin = 96;
float rmax = 255;
// green
float g = 192;
float gvar = 4;
float gmin = 10;
float gmax = 192;
// blue
float b = 192;
float bvar = 2;
float bmin = 96;
float bmax = 255;

// even angles
float axe = PI/13;
float aye = PI/13;
float aze = PI/13;
// odd angles
float axo = -PI/20;
float ayo = -PI/20;
float azo = -PI/20;

void setup() {
  fullScreen(P3D);
  cam = new PeasyCam(this, 800);
  chains = new ArrayList();
  IntList done = new IntList();
  for (int i = N; i >= 2; i--) {
    if (!done.hasValue(i)) {
      IntList chain = collatzChain(i);
      done.append(chain);
      chains.add(chain);
    }
  }
}

void draw() {
  background(0);
  stroke(255);
  drawChains(chains);
}

int collatz(int n) {
  if (n % 2 == 0) {
    return n / 2;
  } else {
    return (3 * n + 1) / 2;
  }
}

IntList collatzChain(int n) {
  IntList l = new IntList();
  if (n < 2) {
    return l;
  }
  while (n != 1) {
    l.append(n);
    n = collatz(n);
  }
  return l;
}

void drawChain(IntList chain) {
  chain.reverse();
  for (int i = 0; i < chain.size(); i++) {
    for (int j = 0; j < 3; j++) {
      if (i < chain.size() - j) {
        int v = chain.get(i + j);
        if (v % 2 == 0) {
          if (j == 0) {
            rotateX(axe);
            r += rvar;
          } else if (j == 1) {
            rotateY(aye);
            g += gvar;
          } else {
            rotateZ(aze);
            b += bvar;
          }
        } else {
          if (j == 0) {
            rotateX(axo);
            r -= rvar;
          } else if (j == 1) {
            rotateY(ayo);
            g -= gvar;
          } else {
            rotateZ(azo);
            b -= bvar;
          }
        }
      }
    }
    if (r < rmin) r = rmin;
    if (r > rmax) r = rmax;
    if (g < gmin) g = gmin;
    if (g > gmax) g = gmax;
    if (b < bmin) b = bmin;
    if (b > bmax) b = bmax;
    stroke(r,g,b);
    line(0, 0, 0, -L, 0, 0);
    translate(-L, 0, 0);
  }
}

float a = 0;

void drawChains(ArrayList<IntList> chains) {
  strokeWeight(W);
  //translate(-100, 250, 0);
  //rotateY(-PI/8);
  //rotateX(PI/8);
  //a += 0.1;
  //rotateZ(a);
  //rotateX(PI/3);
  rotateZ(PI/3);
  translate(-100, 100, 0);
  for(IntList chain : chains) {
    r = 92; g = 92; b = 92;
    //stroke(128+random(128), 50, 128+random(128));
    //resetMatrix();
    //translate(width/5, 12*height/13);
    pushMatrix();
    drawChain(chain.copy());
    popMatrix();
  }
}
