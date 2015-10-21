/**
 ライオン，キリン等の駒データを保持するクラス
 capturedはその駒が取られており，盤面に無い場合にtrueになるものとする．
 そのため，通常はfalseであり，取られた時はteamが入れ替わり，capturedがtrueになる
 その後，相手チームの持ち駒から，盤面に置かれたときにcapturedがfalseに戻る
 
 activeは通常trueだが，ひよこがにわとりに変化したとき，あるいはその逆の場合に
 値が変化する．activeがfalseになると，盤面及び持ち駒として表示されない．
 
 selectedは通常falseで，ユーザにマウスでクリックされたときにtrueになり，
 移動場所が選択されるとfalseに戻る
 **/
class Koma {
  String name;
  int x;
  int y;
  int team;//0 or 1
  KomaStatus kStat;
  //boolean captured;
  //boolean active;
  //boolean selected;

  Koma(String name, int x, int y, int team, boolean active) {
    this.name = name;
    this.x = x;
    this.y = y;
    this.team = team;
    kStat = new KomaStatus(active);
    //this.captured = false;
    //this.active = active;
    //this.selected = false;
  }

  /**
   ** 自分自身（駒）を描画するメソッド
   **/
  void draw() {
    String komaImage = "";
    if (this.team==0 && kStat.exists()) {
      komaImage = this.name+"A.png";
    } else if (this.team==1 && kStat.exists()) {
      komaImage = this.name+"B.png";
    } else {
      return;
    }
    PImage img = loadImage(komaImage);
    image(img, board.squareSize*this.x+2, this.y*board.squareSize+2, board.squareSize-4, board.squareSize-4);
  }

  /**
   ** 取られた自分自身（駒）を持ち駒表示領域の指定箇所(index)に描画するメソッド
   **/
  void drawCaptured(int index) {
    String komaImage = "";
    if (this.team==0 && kStat.isCaptured()) {
      komaImage = this.name+"A.png";
    } else if (this.team==1 && kStat.isCaptured()) {
      komaImage = this.name+"B.png";
    } else {
      return;
    }
    PImage img = loadImage(komaImage);
    image(img, 2, index*board.squareSize+2, board.squareSize-4, board.squareSize-4);
    this.x=0;
    this.y=index;
  }

  /**
   ** 対象の駒が(x,y)に移動できるかどうか
   **/
  boolean canMove(int x, int y) {
    //println("x:"+x+" y:"+y+" this.x:"+this.x+" this.y:"+this.y);
    
    //範囲外への移動の場合は無条件でダメ．範囲内であれば持ち駒はどこにでも移動可能
    if (x<0 || x>3 || y<0 || y>2) return false;
    else if(this.kStat.isCaptured()) return true;

    if (abs(x-this.x)+abs(y-this.y) ==0) return false;

    //ライオン
    if (this.name.equals("lion") && abs(x-this.x) <= 1 && abs(y-this.y) <=1) return true;

    //ひよこ
    if (this.name.equals("hiyoko")) {
      if (this.team == 0 && x-this.x==1 && y-this.y==0) return true;
      else if (this.team == 1 && this.x-x==1 && y-this.y==0) return true;
    }

    //象
    if (this.name.equals("zou") && abs(x-this.x) ==1 && abs(y-this.y) ==1) return true;

    //キリン
    if (this.name.equals("kirin") && abs(x-this.x)+abs(y-this.y) ==1) return true;
    
    //にわとり
    if(this.name.equals("niwatori")){
      if(this.team==0 && abs(x-this.x)<=1 && abs(y-this.y)<=1 && (this.x-x+abs(this.y-y))<2) return true;
      if(this.team==1 && abs(x-this.x)<=1 && abs(y-this.y)<=1 && (x-this.x+abs(this.y-y))<2) return true;
    }

    return false;
  }

  /**
   ** 対象の駒を取る(capture)ことができるか
   **/
  boolean canCapture(Koma koma) {
    if(this.kStat.isCaptured()) return false;
    else if (this.team != koma.team) return true;
    else return false;
  }
}