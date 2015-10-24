class KomaList {
  AbstractKoma[] komaArray = new AbstractKoma[10];

  KomaList() {
    komaArray[0] = new Hiyoko("hiyoko", 2, 1, 0);
    komaArray[1] = new Hiyoko("hiyoko", 3, 1, 1);
    komaArray[2] = new Zou("zou", 1, 0, 0);
    komaArray[3] = new Zou("zou", 4, 2, 1);
    komaArray[4] = new Kirin("kirin", 1, 2, 0);
    komaArray[5] = new Kirin("kirin", 4, 0, 1);
    komaArray[6] = new Lion("lion", 1, 1, 0);
    komaArray[7] = new Lion("lion", 4, 1, 1);
    komaArray[8] = new Niwatori("niwatori", 0, 0, 0);//後でnon activeにする
    komaArray[9] = new Niwatori("niwatori", 5, 0, 1);//後でnon activeにする
  }
  void draw() {
    for (AbstractKoma k : komaArray) {
      k.draw();
    }
  }

  //Mochigoma Areaに空きスペースがないか探索
  int getBlankIndexInMochigomaArea(int team) {
    for (int i=board.mArea[team].posY; i<board.mArea[team].posY+board.mArea[team].tate; i++) {
      AbstractKoma koma = this.getKomaFromPlace(board.mArea[team].posX, i);
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
      if (team==k.team && x == k.x && y == k.y && k.kStat.active) return k;
    }
    return null;
  }
  AbstractKoma getKomaFromPlace(int x, int y) {
    for (AbstractKoma k : this.komaArray) {
      if (x == k.x && y == k.y && k.kStat.active) return k;
    }
    return null;
  }

  //ひよこが相手陣地に到着すると鶏に昇格する（ただし持ち駒からいきなり相手陣地に置かれた場合は昇格しない）
  void promote(AbstractKoma hiyoko, int toX, int toY) {
    for (AbstractKoma k : komaArray) {
      if (k.name.equals("niwatori") && !k.kStat.active) {
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