class KomaList {
  AbstractKoma[] komaArray = new AbstractKoma[10];

  KomaList() {
    komaArray[0] = new Hiyoko("hiyoko", 2, 1, 0, true);
    komaArray[1] = new Hiyoko("hiyoko", 3, 1, 1, true);
    komaArray[2] = new Zou("zou", 1, 0, 0, true);
    komaArray[3] = new Zou("zou", 4, 2, 1, true);
    komaArray[4] = new Kirin("kirin", 1, 2, 0, true);
    komaArray[5] = new Kirin("kirin", 4, 0, 1, true);
    komaArray[6] = new Lion("lion", 1, 1, 0, true);
    komaArray[7] = new Lion("lion", 4, 1, 1, true);
    komaArray[8] = new Niwatori("niwatori", 0, 0, 0, false);
    komaArray[9] = new Niwatori("niwatori", 5, 0, 1, false);
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
  AbstractKoma getKomaFromPlace(int x, int y) {
    for (AbstractKoma k : this.komaArray) {
      if (x == k.x && y == k.y && k.kStat.active) return k;
    }
    return null;
  }

  //鶏が相手に取られると降格(demote)する
  void demote(AbstractKoma niwatori) {
    for (AbstractKoma k : komaArray) {
      if (k.name.equals("hiyoko") && !k.kStat.active) {
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