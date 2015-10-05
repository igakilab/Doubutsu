static int squareSize = 100; //<>//
Banmen banmen;
boolean selected = false;
KomaSet mySet = new KomaSet();
void setup() {
  surface.setSize(6*squareSize, 4*squareSize);
  banmen = new Banmen(mySet);
}

void draw(){
  banmen.drawBaseBanmen();
  banmen.drawMochiBanmen();
  banmen.drawKomas();
}

void mouseReleased(){
  int x = mouseX/squareSize;
  int y = mouseY/squareSize;
  println("x:"+x + " y:"+y);
  banmen.select(x,y);
}