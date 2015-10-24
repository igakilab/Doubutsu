class InfoArea extends AbstractArea {
  InfoArea(int posX, int posY, int yoko, int tate) {
    super(posX, posY, yoko, tate);
  }
  void draw() {
    fill(#FFFFFF);
    rect(posX*board.squareSize, posY*board.squareSize, yoko*board.squareSize, tate*board.squareSize);
    fill(#000000);
    textSize(20);
    if (gs.win==0) {
      text("Left win!!", (posX+0.3)*board.squareSize, (posY+0.5)*board.squareSize);
      text("Retry?", ((posX+yoko)/2+0.8)*board.squareSize, (posY+tate-0.5)*board.squareSize);
    } else if (gs.win==1) {
      text("Right win!!", (posX+yoko-1.3)*board.squareSize, (posY+0.5)*board.squareSize);
      text("Retry?", ((posX+yoko)/2+0.8)*board.squareSize, (posY+tate-0.5)*board.squareSize);
    } else if (gs.turn==0) {
      text("<- Left turn", (posX+0.3)*board.squareSize, (posY+0.5)*board.squareSize);
    } else {
      text("Right turn ->", (posX+yoko-1.7)*board.squareSize, (posY+0.5)*board.squareSize);
    }
  }
}