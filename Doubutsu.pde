final int SQUARESIZE = 100; //<>//
Board board;

void setup() {
  surface.setSize(6*SQUARESIZE, 4*SQUARESIZE);
}

void draw() {
  board.draw();
}