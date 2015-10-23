class KomaList {
  AbstractKoma[] komaArray = new AbstractKoma[10];

  KomaList() {
    komaArray[0] = new Hiyoko("hiyoko", 2, 1, 0);
    komaArray[1] = new Hiyoko("hiyoko", 3, 1, 1);
    komaArray[2] = new Hiyoko("zou", 1, 0, 0);
    komaArray[3] = new Hiyoko("zou", 4, 2, 1);
    komaArray[4] = new Hiyoko("kirin", 1, 2, 0);
    komaArray[5] = new Hiyoko("kirin", 4, 0, 1);
    komaArray[6] = new Hiyoko("lion", 1, 1, 0);
    komaArray[7] = new Hiyoko("lion", 4, 1, 1);
    komaArray[8] = new Niwatori("niwatori", 0, 0, 0);//後でnon activeにする
    komaArray[9] = new Niwatori("niwatori", 5, 0, 1);//後でnon activeにする
  }
  void draw() {
    for (AbstractKoma k : komaArray) {
      k.draw();
    }
  }

  int getBlankIndexInMochigomaArea(int team) {
    //Mochigoma Areaに空きスペースがないか探索
    for (int i=board.mArea[team].posY; i<board.mArea[team].posY+board.mArea[team].tate; i++) {
      AbstractKoma koma = this.getKomaFromPlaceByTeam(board.mArea[team].posX, i, team);
      if (koma==null) return i;
    }
    return -1;//空きが無い場合
  }

  AbstractKoma getSelectedKoma() {
    for (AbstractKoma k : komaArray) {
      if (k.kStat.selected) return k;
    }
    return null;
  }

  void select(int x, int y) {
    AbstractKoma koma = this.getKomaFromPlaceByTeam(x, y, gs.turn);
    if (koma != null) koma.kStat.selected=true;
  }
  AbstractKoma getKomaFromPlaceByTeam(int x, int y, int team) {
    for (AbstractKoma k : this.komaArray) {
      if (team==k.team && x == k.x && y == k.y && k.kStat.active) {
        println(k.name+k.team+":"+k.x+";"+k.y);
        return k;
      }
    }
    return null;
  }
  AbstractKoma getKomaFromPlace(int x, int y) {
    for (AbstractKoma k : this.komaArray) {
      if (x == k.x && y == k.y && k.kStat.active) {
        return k;
      }
    }
    return null;
  }
  
  //鶏が相手に取られると降格(demote)する
  void demote(AbstractKoma niwatori){
    for(AbstractKoma k:komaArray){
      if(k.name.equals("hiyoko") && !k.kStat.active){
        niwatori.kStat.active = false;
        k.kStat.active = true;
        k.kStat.captured = true;
        k.kStat.selected = false;
        k.x = niwatori.x;
        k.y = niwatori.y;
        k.team = niwatori.team;
        break;
      }
    }
  }
  
  void promote(AbstractKoma hiyoko,int toX, int toY){
    for(AbstractKoma k : komaArray){
      if(k.name.equals("niwatori") && !k.kStat.active){
        hiyoko.kStat.active = false;
        k.kStat.active = true;
        k.kStat.captured = false;
        k.kStat.selected = false;
        k.x = toX;
        k.y = toY;
        k.team = hiyoko.team;
        break;
      }
    }
  }
}