GameStatus gs; //<>//
Board board;
AbstractKoma hiyoko = new Hiyoko("hiyoko", 2, 1, 0);

void setup() {
  this.reset();
  surface.setSize(6*board.squareSize, 4*board.squareSize);
}

void draw() {
  board.draw();
  hiyoko.draw();
}

void reset() {
  gs = new GameStatus();
  board = new Board();
}