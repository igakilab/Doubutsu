class Lion extends AbstractKoma {

  Lion(String name, int x, int y, int team, boolean active) {
    super(name, x, y, team, active);
  }

  boolean canMove(int toX, int toY) {

    if (!board.bArea.isInThisArea(toX,toY)) return false;

    if ((abs(toX-this.x) <= 1 && abs(toY-this.y) <=1) && !this.isCapturedByEnemy(toX, toY)) return true;

    return false;
  }

  //Lionが入場する状態でcaptureできる駒があるかを確認する(ある場合にtrue)
  boolean isCapturedByEnemy(int toX, int toY) {

    //Lionが敵陣地に入場するときのみチェックする
    if (this.team==0 && toX!=board.bArea.posX+board.bArea.yoko-1) return false;
    if (this.team==1 && toX!=board.bArea.posX) return false;

    ArrayList<AbstractKoma> enemies = new ArrayList<AbstractKoma>();

    int[][] direction = {{-1, -1}, {-1, 0}, {-1, 1}, {0, 1}, {0, -1}, {1, 0}, {1, 1}, {1, -1}};
    for (int[] d : direction) {
      AbstractKoma enemy = komaList.getKomaFromPlaceByTeam(toX+d[0], toY+d[1], (this.team+1)%2); 
      if (enemy!=null && !enemy.kStat.isCaptured()) enemies.add(enemy);
    }
    for (AbstractKoma k : enemies) {
      if (k.canMove(toX, toY)) return true;
    }
    return false;
  }
}