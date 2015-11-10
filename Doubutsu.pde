final int SQUARESIZE = 100; //<>//
GameStatus gs;
Board board;
KomaList komaList;

void setup() {
  this.reset();
  surface.setSize(6*SQUARESIZE, 4*SQUARESIZE);
}

void draw() {
  board.draw();
  komaList.draw();
  gs.checkWinner();
}

void mouseReleased() {
  int x = mouseX/SQUARESIZE;
  int y = mouseY/SQUARESIZE;
  if (gs.win>=0 && board.iArea.isInThisArea(x,y)) this.reset();
  else if (gs.win<0) board.select(x, y);
}

void reset() {
  gs = new GameStatus();
  board = new Board();
  komaList = new KomaList();
}