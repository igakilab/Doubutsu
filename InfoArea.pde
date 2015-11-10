class InfoArea extends AbstractArea {
  InfoArea(int posX, int posY, int yoko, int tate) {
    super(posX, posY, yoko, tate);
  }
  void draw() {
    fill(#FFFFFF);
    rect(posX*SQUARESIZE, posY*SQUARESIZE, yoko*SQUARESIZE, tate*SQUARESIZE);
    fill(#000000);
    textSize(20);
    if (gs.win==0) {
      text("Left win!!", (posX+0.3)*SQUARESIZE, (posY+0.5)*SQUARESIZE);
      text("Retry?", ((posX+yoko)/2+0.8)*SQUARESIZE, (posY+tate-0.5)*SQUARESIZE);
    } else if (gs.win==1) {
      text("Right win!!", (posX+yoko-1.3)*SQUARESIZE, (posY+0.5)*SQUARESIZE);
      text("Retry?", ((posX+yoko)/2+0.8)*SQUARESIZE, (posY+tate-0.5)*SQUARESIZE);
    } else if (gs.turn==0) {
      text("<- Left turn", (posX+0.3)*SQUARESIZE, (posY+0.5)*SQUARESIZE);
    } else {
      text("Right turn ->", (posX+yoko-1.7)*SQUARESIZE, (posY+0.5)*SQUARESIZE);
    }
  }
}