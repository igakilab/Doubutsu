GameStatus gs; //<>//
Board board;

void setup() {
  this.reset();
  surface.setSize(6*board.squareSize, 4*board.squareSize);
}

void draw() {
  board.draw();
}

void reset() {
  gs = new GameStatus();
  board = new Board();
}