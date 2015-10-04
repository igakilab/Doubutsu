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
  
  Koma[] getKomas(){
    return this.komas;
  }
}