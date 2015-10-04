class Banmen {
  final int baseYoko = 4;
  final int baseTate = 3;
  final int mochiHaba = 4;
  KomaSet mySet;
  Banmen(KomaSet ks){
    this.mySet = ks;
  }

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
        //this.drawKoma(banmen[i][j], i, j);
      }
    }
    popMatrix();
  }
  void drawBaseMochiBanmen() {
    pushMatrix();
    stroke(#FFFFFF);
    //strokeWeight(2);
    for (int i=0; i<2; i++) {
      for (int j=0; j<mochiHaba; j++) {
        fill(#FFCCFF);
        rect(squareSize*i, j*squareSize, squareSize, squareSize);
      }
      translate(baseYoko*squareSize, 0);
    }
    popMatrix();
  }
  void drawKoma() {
    String komaImage = "";
    PImage img;
    pushMatrix();
    translate(squareSize, 0);
    for (Koma k : this.mySet.getKomas()) {
      if (k.getTeam()==0) {
        komaImage = k.getName()+"A.png";
      } else {
        komaImage = k.getName()+"B.png";
      }
      img = loadImage(komaImage);
      image(img, squareSize*k.getX()+2, k.getY()*squareSize+2, squareSize-4, squareSize-4);
    }
    popMatrix();
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