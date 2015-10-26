GameStatus gs; //<>//
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

void reset() {
  gs = new GameStatus();
  board = new Board();
  komaList = new KomaList();
}