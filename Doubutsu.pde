GameStatus gs; //<>// //<>//
Board board;
KomaList komaList;

void setup() {
  this.reset();
  surface.setSize(6*board.squareSize, 4*board.squareSize);
}

void draw() {
  board.draw();
  komaList.draw();
}

void mouseReleased() {
  int x = mouseX/board.squareSize;
  int y = mouseY/board.squareSize;
  if (gs.win>=0 && board.iArea.isInThisArea(x,y)) this.reset();
  else if (gs.win<0) board.select(x, y);
}

void reset() {
  gs = new GameStatus();
  board = new Board();
  komaList = new KomaList();
}