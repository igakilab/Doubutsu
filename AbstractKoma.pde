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
    if (this.team==0 && this.kStat.active) komaImage = this.name+"A.png";
    else if (this.team==1 && this.kStat.active) komaImage = this.name+"B.png";
    else return;

    PImage img = loadImage(komaImage);
    image(img, board.squareSize*this.x+2, this.y*board.squareSize+2, board.squareSize-4, board.squareSize-4);

  }
}