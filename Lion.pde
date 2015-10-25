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
}