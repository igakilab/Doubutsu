static int squareSize = 100; //<>//
Banmen banmen;
GameStatus gs;
KomaSet mySet;

void setup() {
  surface.setSize(6*squareSize, 4*squareSize);
  mySet = new KomaSet();
  banmen = new Banmen();
  gs = new GameStatus();
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
  if(gs.win>=0 && y>=3 && x>=2 && x<=3){
    this.reset();
  }else if(gs.win<0){
    banmen.select(x,y);
  }
}

void reset(){
  gs = new GameStatus();
  mySet = new KomaSet();
  banmen = new Banmen();
}