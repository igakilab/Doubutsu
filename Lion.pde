class Lion extends AbstractKoma {

  Lion(String name, int x, int y, int team) {
    super(name, x, y, team);
  }

  boolean canMove(int toX, int toY) {

    if (toX<board.bArea.posX || toX>=board.bArea.posX+board.bArea.yoko || toY<board.bArea.posY || toY>=board.bArea.posY+board.bArea.tate) return false;
    else if (this.kStat.isCaptured()) return true;

    if ((abs(toX-this.x) <= 1 && abs(toY-this.y) <=1)) return true;

    return false;
  }
<<<<<<< HEAD
=======

  //Lionが入場する状態でcaptureできる駒があるかを確認する(ある場合にtrue)
  boolean canEnemyCaptureLion(int toX, int toY) {

    //Lionが敵陣地に入場するときのみチェックする
    if (this.team==0 && toX!=board.bArea.posX+board.bArea.yoko-1) return false;
    if (this.team==1 && toX!=board.bArea.posX) return false;

    ArrayList<AbstractKoma> enemies = new ArrayList<AbstractKoma>();

    int[][] direction = {{-1, -1}, {-1, 0}, {-1, 1}, {0, 1}, {0, -1}, {1, 0}, {1, 1}, {1, -1}};
    for (int[] d : direction) {
      AbstractKoma enemy = komaList.getKomaFromPlaceByTeam(toX+d[0], toY+d[1], (this.team+1)%2); 
      if (enemy!=null && enemy.existsInBaseArea()) enemies.add(enemy);
    }
    for (AbstractKoma k : enemies) {
      if (k.canMove(toX, toY)) return true;
    }
    return false;
  }
>>>>>>> refs/remotes/origin/master
}