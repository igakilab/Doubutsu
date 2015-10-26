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
    komaArray[8] = new Hiyoko("niwatori", 0, 0, 0);//後でnon activeにする
    komaArray[9] = new Hiyoko("niwatori", 5, 0, 1);//後でnon activeにする
  }
  void draw() {
    for (AbstractKoma k : komaArray) {
      k.draw();
    }
  }
}