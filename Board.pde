class Board { //<>// //<>// //<>//
  final int lionA = 1, lionB=11;
  final int kirinA = 2, kirinB=12;
  final int zouA = 3, zouB =13;
  final int hiyokoA = 4, hiyokoB=14;
  final int niwatoriA = 5, niwatoriB=15;
  final int nothing = 0;
  int[][] banmen = {{zouA, lionA, kirinA}, {nothing, hiyokoA, nothing}, {nothing, hiyokoB, nothing}, {kirinB, lionB, zouB}};
  int[][] mochibanmen = {{nothing, nothing, nothing}, {nothing, nothing, nothing}};

  Board() {
    this.drawBaseBanmen();
    this.drawMochiBanmen();
    //translate(squareSize,0);
    //img = loadImage("lionA.png");
    //image(img, squareSize*0, 1*squareSize, squareSize, squareSize);
  }

  //Base Banmen
  void drawBaseBanmen() {
    pushMatrix();
    translate(squareSize, 0);
    noStroke();
    for (int i=0; i<baseYoko; i++) {
      for (int j=0; j<baseTate; j++) {
        fill(#000000);
        if ( ((i+j) % 2) == 1) {
          fill(#FFFFFF);
        }
        rect(squareSize*i, j*squareSize, squareSize, squareSize);
        this.drawKoma(banmen[i][j], i, j);
      }
    }
    popMatrix();
  }
  void drawMochiBanmen() {
    pushMatrix();
    noStroke();
    for (int i=0; i<2; i++) {
      for (int j=0; j<4; j++) {
        fill(#FFCCFF);
        rect(squareSize*i, j*squareSize, squareSize, squareSize);
      }
      translate(baseYoko*squareSize, 0);
    }
    popMatrix();
  }

  void drawKoma(int komaNumber, int x, int y) {
    if(komaNumber == nothing) return;
    String komaImage = komaNumber + ".png";
    PImage img;
    img = loadImage(komaImage);
    image(img, squareSize*x, y*squareSize, squareSize, squareSize);
  }
}