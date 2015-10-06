class KomaSet {
  Koma[] komas = new Koma[10];

  KomaSet() {
    komas[0] = new Koma("lion", 0, 1, 0, true);
    komas[1] = new Koma("kirin", 0, 2, 0, true);
    komas[2] = new Koma("zou", 0, 0, 0, true);
    komas[3] = new Koma("hiyoko", 1, 1, 0, true);
    komas[4] = new Koma("lion", 3, 1, 1, true);
    komas[5] = new Koma("kirin", 3, 0, 1, true);
    komas[6] = new Koma("zou", 3, 2, 1, true);
    komas[7] = new Koma("hiyoko", 2, 1, 1, true);
    komas[8] = new Koma("niwatori", 1, 1, 0, false);
    komas[9] = new Koma("niwatori", 2, 1, 1, false);
  }

  Koma[] getKomas() {
    return this.komas;
  }

  Koma getKomaFromPlace(int x, int y) {
    for (Koma k : komas) {
      if (x == k.x && y == k.y && k.active && !k.captured) {
        return k;
      }else if(x==-1 && k.captured && k.team==0 && k.y==y){
        println(k.name+k.team);
        return k;
      }else if(x==4 && k.captured && k.team==1 && k.y==y){
        println(k.name+k.team);
        return k;
      }
    }
    return null;
  }
  Koma getSelectedKoma() {
    for (Koma k : komas) {
      if (k.selected==true) {
        return k;
      }
    }
    return null;
  }
  Koma[] getCapturedKoma(int team) {
    ArrayList<Koma> cKomas = new ArrayList<Koma>();
    for (Koma k : komas) {
      if (k.captured && k.team==team) {
        //print(" Captured:"+k.name+" team:"+k.team);
        cKomas.add(k);
      }
    }

    return cKomas.toArray(new Koma[0]);
  }
  Koma getKomaByNameAndTeam(String name, int team) {
    for (Koma k : komas) {
      if (k.name.equals(name) && k.team==team) {
        return k;
      }
    }
    return null;
  }
  /**
   ** 駒の取得(capture)及び勝利条件（ライオンの取得）確認
   **/
  void capture(Koma toru, Koma torareru) {
    if (torareru.name.equals("niwatori")) {
      torareru.active=false;
      Koma hiyoko = this.getKomaByNameAndTeam("hiyoko", torareru.team);
      hiyoko.active=true;
      hiyoko.captured=true;
      hiyoko.team = (hiyoko.team+1)%2;
    } else if (torareru.name.equals("lion")) {
      win=toru.team;
    } else {
      torareru.captured=true;
      print(torareru.name+" team:"+torareru.team);
      torareru.team = (torareru.team+1)%2;
      println(" to:"+torareru.team);
    }
  }

  /**
   ** 駒の移動
   **/
  void move(Koma k, int x, int y) {
    if (k.name.equals("hiyoko") && ( k.team==0 && x==3 || k.team==1 && x==0 )) {
      Koma niwatori = this.getKomaByNameAndTeam("niwatori", k.team);
      k.active = false;
      niwatori.active = true;
      niwatori.x = x;
      niwatori.y = y;
    } else {
      k.x = x;
      k.y = y;
    }
  }
}