class KomaList {
  AbstractKoma[] komaArray = new AbstractKoma[10];

  KomaList() {
    komaArray[0] = new Hiyoko("hiyoko", 2, 1, 0);
    komaArray[1] = new Hiyoko("hiyoko", 3, 1, 1);
    komaArray[2] = new Zou("zou", 1, 0, 0);
    komaArray[3] = new Zou("zou", 4, 2, 1);
    komaArray[4] = new Kirin("kirin", 1, 2, 0);
    komaArray[5] = new Kirin("kirin", 4, 0, 1);
    komaArray[6] = new Hiyoko("lion", 1, 1, 0);
    komaArray[7] = new Hiyoko("lion", 4, 1, 1);
    komaArray[8] = new Hiyoko("niwatori", 0, 0, 0);//後でnon activeにする
    komaArray[9] = new Hiyoko("niwatori", 5, 0, 1);//後でnon activeにする
  }
  void draw() {
    for (AbstractKoma k : komaArray) {
      k.draw();
    }
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

}