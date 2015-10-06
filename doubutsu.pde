static int squareSize = 100; //<>//
Banmen banmen;
int turn = 0;
int win = -1;//0になるとLeftの勝ち，1になるとRightの勝ち
boolean selected = false;
KomaSet mySet;
void setup() {
  surface.setSize(6*squareSize, 4*squareSize);
  mySet = new KomaSet();
  banmen = new Banmen();
}

void draw(){
  banmen.drawBaseBanmen();
  banmen.drawBaseMochiBanmen();
  banmen.drawKomas();
  banmen.drawMochiKomas();
  banmen.drawInfo();
}

void mouseReleased(){
  int x = mouseX/squareSize;
  int y = mouseY/squareSize;
  if(win>=0 && y>=3 && x>=2 && x<=3){
    this.reset();
  }else{
    banmen.select(x,y);
  }
}

void reset(){
  turn = 0;
  win = -1;
  selected = false;
  mySet = new KomaSet();
  banmen = new Banmen();
}