abstract class AbstractKoma {
  String name;
  int x;
  int y;
  int team;//0 or 1
  KomaStatus kStat;

  AbstractKoma(String name, int x, int y, int team, boolean active) {
    this.name = name;
    this.x = x;
    this.y = y;
    this.team = team;
    this.kStat = new KomaStatus(active);
  }

  abstract boolean canMove(int toX, int toY);

  /**
   ** 自分自身（駒）を描画するメソッド
   **/
  void draw() {
    String komaImage = "";
    if (this.team==0 && this.kStat.active) komaImage = this.name+"A.png";
    else if (this.team==1 && this.kStat.active) komaImage = this.name+"B.png";
    else return;

    PImage img = loadImage(komaImage);
    image(img, SQUARESIZE*this.x+2, this.y*SQUARESIZE+2, SQUARESIZE-4, SQUARESIZE-4);

    if (this.kStat.selected) this.drawSelected();
  }

  //選択されている駒の色を変える
  void drawSelected() {
    fill(#FF0000, SQUARESIZE);
    rect(this.x*SQUARESIZE, this.y*SQUARESIZE, SQUARESIZE, SQUARESIZE);
  }

  void move(int toX, int toY) {
    AbstractKoma koma = komaList.getKomaFromPlace(toX, toY);
    if (this.kStat.isCaptured() && koma==null) {
      this.updatePos(toX, toY);
    } else if((koma==null || koma.team != gs.turn) && this.canMove(toX, toY)) {
      this.moveAndCapture(koma, toX, toY);
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
    this.y = board.mArea[this.team].getBlankYIndex();
    this.x = board.mArea[this.team].posX;
  }

}