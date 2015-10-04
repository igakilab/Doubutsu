/**
 ライオン，キリン等の駒データを保持するクラス
 capturedはその駒が取られており，盤面に無い場合にtrueになるものとする．
 そのため，通常はfalseであり，取られた時はteamが入れ替わり，capturedがtrueになる
 その後，相手チームの持ち駒から，盤面に置かれたときにcapturedがfalseに戻る
 
 activeは通常trueだが，ひよこがにわとりに変化したとき，あるいはその逆の場合に
 値が変化する．activeがfalseになると，盤面及び持ち駒として表示されない．
**/
class Koma{
  private String name;
  private int x;//x,y不要かも
  private int y;
  private int team;//0 or 1
  private boolean captured;
  private boolean active;
  
  Koma(String name, int x, int y, int team, boolean active){
    this.name = name;
    this.x = x;
    this.y = y;
    this.team = team;
    this.captured = false;
  }
  String getName(){
    return this.name;
  }
  int getX(){
    return this.x;
  }
  void setX(int x){
    this.x = x;
  }
  int getY(){
    return this.y;
  }
  void setY(int y){
    this.y = y;
  }
  int getTeam(){
    return this.team;
  }
  void setTeam(int team){
    this.team = team;
  }
  boolean isCaptured(){
    return this.captured;
  }
  void setCaptured(boolean captured){
    this.captured = captured;
  }
}