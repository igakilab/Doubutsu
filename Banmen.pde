class Banmen { //<>// //<>// //<>//
  final int baseYoko = 4;
  final int baseTate = 3;
  final int mochiHaba = 4;

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
  void drawBaseMochiBanmen(){
    pushMatrix();
    fill(#CCCCCC);
    for (int i=0; i<2; i++) {
      for (int j=0; j<this.mochiHaba; j++) {
        rect(0, j*squareSize, squareSize, squareSize);
      }
      translate((baseYoko+1)*squareSize, 0);
    }
    popMatrix();
  }
  void drawKomas() {
    pushMatrix();
    translate(squareSize, 0);
    for (Koma k : mySet.getKomas()) {
      k.draw();
    }
    popMatrix();
  }
  void drawMochiKomas() {
    pushMatrix();
    stroke(#FFFFFF);
    //strokeWeight(2);
    for (int i=0; i<2; i++) {
      Koma[] cKomas = mySet.getCapturedKoma(i); //<>//
      for (int j=0; j<cKomas.length; j++) {
        cKomas[j].drawCaptured(j);
      }
      translate((baseYoko+1)*squareSize, 0);
    }
    popMatrix();
  }
  void drawInfo() {
    fill(#FFFFFF);
    rect(squareSize, 3*squareSize, baseYoko*squareSize, squareSize);
    fill(#000000);
    textSize(20);
    if (win==0) {
      text("Left Win!!", 1.5*squareSize, 3.5*squareSize);
      text("Retry?", 2.8*squareSize, 3.8*squareSize);
    } else if (win==1) {
      text("Right Win!!", 3.5*squareSize, 3.5*squareSize);
      text("Retry?", 2.5*squareSize, 3.8*squareSize);
    } else if (turn==0) {
      text("<- Left Turn", 1.5*squareSize, 3.5*squareSize);
    } else {
      text("Right Turn ->", 3.5*squareSize, 3.5*squareSize);
    }
  }

  /**
   ** 盤面がクリックされたときによばれるメソッド
   ** ベースとなる盤面での処理（駒の座標等）は(x-1, y)として表現される(両サイドが持ち駒領域なため）．
   **/
  void select(int x, int y) {
    if (!selected) {
      println("selected x:" + x +" y:"+y);
      Koma koma = mySet.getKomaFromPlace(x-1, y);
      //println("turn:"+turn + " koma.name:" + koma.name +" team:"+koma.team);
      print("[3]:" + mySet.getKomas()[3].name+mySet.getKomas()[3].team);
      print(" [7]:" + mySet.getKomas()[7].name+mySet.getKomas()[7].team);
      println(" ");
      if (koma != null && koma.team == turn) {
        fill(#FF0000, 100);
        rect(x*squareSize, y*squareSize, squareSize, squareSize);
        koma.selected=true;
        selected = true;
        noLoop();
      }
    } else {
      Koma koma = mySet.getSelectedKoma();
      if (koma != null) {
        if (koma.canMove(x-1, y)) {
          Koma koma2 = mySet.getKomaFromPlace(x-1, y);
          if (koma2 != null && koma.canCapture(koma2)) {
            mySet.capture(koma, koma2);
            mySet.move(koma, x-1, y);
            turn = (turn+1)%2;
          } else if (koma2==null) {
            koma.captured=false;
            mySet.move(koma, x-1, y);
            turn = (turn+1)%2;
          }
        }
        koma.selected=false;
      }
      selected = false;
      loop();
    }
  }
}