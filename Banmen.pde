class Banmen { //<>//
  final int baseYoko = 4;
  final int baseTate = 3;
  final int mochiHaba = 4;

  void drawKomas() {
    pushMatrix();
    translate(board.squareSize, 0);
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
      Koma[] cKomas = mySet.getCapturedKoma(i);
      for (int j=0; j<cKomas.length; j++) {
        cKomas[j].drawCaptured(j);
      }
      translate((baseYoko+1)*board.squareSize, 0);
    }
    popMatrix();
  }
  void drawInfo() {
    fill(#FFFFFF);
    rect(board.squareSize, 3*board.squareSize, baseYoko*board.squareSize, board.squareSize);
    fill(#000000);
    textSize(20);
    if (gs.win==0) {
      text("Left win!!", 1.5*board.squareSize, 3.5*board.squareSize);
      text("Retry?", 2.8*board.squareSize, 3.8*board.squareSize);
    } else if (gs.win==1) {
      text("Right win!!", 3.5*board.squareSize, 3.5*board.squareSize);
      text("Retry?", 2.5*board.squareSize, 3.8*board.squareSize);
    } else if (gs.turn==0) {
      text("<- Left turn", 1.5*board.squareSize, 3.5*board.squareSize);
    } else {
      text("Right turn ->", 3.5*board.squareSize, 3.5*board.squareSize);
    }
  }

  /**
   ** 盤面がクリックされたときによばれるメソッド
   ** ベースとなる盤面での処理（駒の座標等）は(x-1, y)として表現される(両サイドが持ち駒領域なため）．
   **/
  void select(int x, int y) {
    if (!gs.selected) {
      println("selected x:" + x +" y:"+y);
      Koma koma = mySet.getKomaFromPlace(x-1, y);
      //println("gs.turn:"+gs.turn + " koma.name:" + koma.name +" team:"+koma.team);
      //print("[3]:" + mySet.getKomas()[3].name+mySet.getKomas()[3].team);
      //print(" [7]:" + mySet.getKomas()[7].name+mySet.getKomas()[7].team);
      //println(" ");
      if (koma != null && koma.team == gs.turn) {
        fill(#FF0000, 100);
        rect(x*board.squareSize, y*board.squareSize, board.squareSize, board.squareSize);
        koma.kStat.selected=true;
        gs.selected = true;
        noLoop();
      }
    } else {
      Koma koma = mySet.getSelectedKoma();
      if (koma != null) {
        if (koma.name.equals("lion") && ((koma.team==0 && (x-1)==3) || (koma.team==1 && (x-1)==0)) && koma.canMove(x-1, y)) {
          if (mySet.canLionMove(koma, x-1, y)) mySet.move(koma, x-1, y);
        } else if (koma.canMove(x-1, y)) {
          Koma koma2 = mySet.getKomaFromPlace(x-1, y);
          if (koma2 != null && koma.canCapture(koma2)) {
            mySet.capture(koma, koma2);
            mySet.move(koma, x-1, y);
            gs.turn = (gs.turn+1)%2;
          } else if (koma2==null) {
            mySet.move(koma, x-1, y);
            koma.kStat.captured=false;
            gs.turn = (gs.turn+1)%2;
          }
        }
        koma.kStat.selected=false;
      }
      gs.selected = false;
      loop();
    }
  }
}