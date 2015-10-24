GameStatus gs; //<>//
Board board;
KomaList komaList;
Logger logger = new Logger();

void setup() {
  this.reset();
  surface.setSize(6*board.squareSize, 4*board.squareSize);
}

void draw(){
  board.draw();
  komaList.draw();
  gs.checkWinner();
}

void mouseReleased(){
  int x = mouseX/board.squareSize;
  int y = mouseY/board.squareSize;
  if(gs.win>=0 && y>=3 && x>=2 && x<=3){
    this.reset();
  }else if(gs.win<0){
    board.select(x,y);
  }
}

void reset(){
  gs = new GameStatus();
  board = new Board();
  komaList = new KomaList();
}