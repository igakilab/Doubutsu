abstract class AbstractKoma {
  String name;
  int x;
  int y;
  int team;//0 or 1
  KomaStatus kStat;

  AbstractKoma(String name, int x, int y, int team) {
    this.name = name;
    this.x = x;
    this.y = y;
    this.team = team;
    this.kStat = new KomaStatus(true);
  }

  /**
   ** 自分自身（駒）を描画するメソッド
   **/
  void draw() {
    String komaImage = "";
    if (this.team==0 && this.kStat.active) {
      komaImage = this.name+"A.png";
    } else if (this.team==1 && this.kStat.active) {
      komaImage = this.name+"B.png";
    } else {
      return;
    }
    PImage img = loadImage(komaImage);
    image(img, board.squareSize*this.x+2, this.y*board.squareSize+2, board.squareSize-4, board.squareSize-4);

    if (this.kStat.selected) this.drawSelected();
  }

  //選択されている駒の色を変える
  void drawSelected() {
    fill(#FF0000, board.squareSize);
    rect(this.x*board.squareSize, this.y*board.squareSize, board.squareSize, board.squareSize);
  }

  boolean existsInMainArea() {
    return this.kStat.active && !this.kStat.captured;
  }

  void move(int toX, int toY) {
    AbstractKoma koma = komaList.getKomaFromPlace(toX, toY);
    if (this.existsInMainArea()) {
      if ((koma==null || koma.team != gs.turn) && this.canMove(toX, toY)) {
        this.moveAndCapture(koma, toX, toY);
      }
    } else {
      if (koma==null && this.canMove(toX,toY)) {
        this.updatePos(toX, toY);
      }
    }
  }
  void updatePos(int toX, int toY) {
    this.x=toX;
    this.y=toY;
    this.kStat.captured=false;
    gs.turn = (gs.turn+1)%2;
  }

  void moveAndCapture(AbstractKoma enemy, int toX, int toY) {
    this.updatePos(toX, toY);
    if (enemy!=null) enemy.captured();
  }

  //取られた時の処理
  void captured() {
    this.kStat.captured=true;
    this.team = (this.team+1)%2;
    this.y = komaList.getBlankIndexInMochigomaArea(this.team);
    this.x = board.mArea[this.team].posX;
  }

  abstract boolean canMove(int toX, int toY);
}