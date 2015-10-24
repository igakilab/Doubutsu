class GameStatus {
  int turn = 0;
  int win = -1;//0になるとLeftの勝ち，1になるとRightの勝ち
  boolean selected = false;

  void checkWinner() {
    //ライオンがcaptureされているか
    //ライオンが相手陣地に入場しているか
    for (AbstractKoma k : komaList.komaArray) {
      if (k.name.equals("lion")) {
        if(k.kStat.captured || (k.team==0 && k.x==board.bArea.posX+board.bArea.yoko-1) ||(k.team==1 && k.x==board.bArea.posX)){
          this.win=k.team;
          break;
        }
      }
    }
  }
}