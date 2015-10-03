class Board { //<>//
  final int lionA = 1, lionB=11;
  final int kirinA = 2, kirinB=12;
  final int zouA = 3, zouB =13;
  final int hiyokoA = 4, hiyokoB=14;
  final int niwatoriA = 5, niwatoriB=15;
  final int nothing = 0;
  int[][] banmen = {{zouA, lionA, kirinA}, {nothing, hiyokoA, nothing}, {nothing, hiyokoB, nothing}, {kirinB, lionB, zouB}};
  int[][] mochibanmen = {{nothing, nothing, nothing}, {nothing, nothing, nothing}};

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
    stroke(#FFFFFF);
    strokeWeight(2);
    for (int i=0; i<2; i++) {
      for (int j=0; j<mochiHaba; j++) {
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
    image(img, squareSize*x+2, y*squareSize+2, squareSize-4, squareSize-4);
  }
  
  void select(int x, int y){
    if(!selected){
      noLoop();
      fill(#FF0000,100);
      println("selected x:" + x +" y:"+y);
      rect(x*squareSize, y*squareSize, squareSize, squareSize);
      selected = true;
    }else{
      selected = false;
      loop();
    }
  }
}