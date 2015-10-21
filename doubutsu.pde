//final static int squareSize = 100; //<>//
Banmen banmen;
GameStatus gs;
KomaSet mySet;
Board board;
KomaList komaList;

void setup() {
  mySet = new KomaSet();
  banmen = new Banmen();
  gs = new GameStatus();
  board = new Board();
  komaList = new KomaList();
  surface.setSize(6*board.squareSize, 4*board.squareSize);
}

void draw(){
  //banmen.drawBaseBanmen();
  board.draw();
  komaList.draw();
  //banmen.drawBaseMochiBanmen();
  //banmen.drawKomas();
  //banmen.drawMochiKomas();
  //banmen.drawInfo();
}

void mouseReleased(){
  int x = mouseX/board.squareSize;
  int y = mouseY/board.squareSize;
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