static int squareSize = 100; //<>//
static int baseYoko = 4;
static int baseTate = 3;
static int mochiHaba = 4;
Board banmen;
boolean selected = false;
//PImage img;
void setup() {
  surface.setSize(6*squareSize, 4*squareSize);
  banmen = new Board();
}

void draw() {
  //stroke(#FFFFFF);
  //img = loadImage("hiyokoA.png");
  //image(img,squareSize*i, j*squareSize, squareSize, squareSize);
  banmen.drawBaseBanmen();
  banmen.drawMochiBanmen();
}

void mouseReleased(){
  int x = mouseX/squareSize;
  int y = mouseY/squareSize;
  println("x:"+x + " y:"+y);
  banmen.select(x,y);
}