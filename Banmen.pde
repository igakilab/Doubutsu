class Banmen { //<>//
  final int baseYoko = 4;
  final int baseTate = 3;
  final int mochiHaba = 4;
  KomaSet mySet;
  Banmen(KomaSet ks) {
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
      }
    }
    popMatrix();
  }
  void drawKomas() { //<>//
    pushMatrix();
    translate(squareSize, 0);
    for (Koma k : this.mySet.getKomas()) {
      k.draw();
    }
    popMatrix();
  }
  void drawMochiKomas() {
    pushMatrix();
    stroke(#FFFFFF);
    //strokeWeight(2);
    for (int i=0; i<2; i++) {
      Koma[] cKomas = mySet.getCapturedKoma(i);
      for(int j=0;j<cKomas.length;j++){
        cKomas[j].drawCaptured(i,j);
      }
      translate(baseYoko*squareSize, 0);
    }
    popMatrix();
  }
  void select(int x, int y) {
    if (!selected) {
      println("selected x:" + x +" y:"+y);
      Koma koma = mySet.getKomaFromPlace(x-1, y);
      if (koma != null) {
        fill(#FF0000, 100);
        rect(x*squareSize, y*squareSize, squareSize, squareSize);
        koma.selected=true;
        selected = true;
        noLoop();
      }
    } else {
      Koma koma = mySet.getSelectedKoma();
      if (koma != null) {
        Koma koma2 = mySet.getKomaFromPlace(x-1, y);
        if (koma2 != null) {//移動先に駒がある場合はその駒を取る
          koma2.captured=true;
          koma2.team = (koma2.team + 1) % 2;
        }
        koma.x = x-1;
        koma.y = y;
        koma.selected=false;
      }
      selected = false;
      loop();
    }
  }
}