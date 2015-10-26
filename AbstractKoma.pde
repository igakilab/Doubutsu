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
    image(img, board.squareSize*this.x+2, this.y*board.squareSize+2, board.squareSize-4, board.squareSize-4);

    if (this.kStat.selected) this.drawSelected();
  }

  //選択されている駒の色を変える
  void drawSelected() {
    fill(#FF0000, board.squareSize);
    rect(this.x*board.squareSize, this.y*board.squareSize, board.squareSize, board.squareSize);
  }

  void move(int toX, int toY) {
    if (this.canMove(toX, toY)) this.updatePos(toX, toY);
  }
  void updatePos(int toX, int toY) {
    this.x=toX;
    this.y=toY;
    this.kStat.captured=false;
    gs.turn = (gs.turn+1)%2;
  }

}