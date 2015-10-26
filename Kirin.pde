class Kirin extends AbstractKoma {

  Kirin(String name, int x, int y, int team) {
    super(name, x, y, team);
  }

  boolean canMove(int toX, int toY) {

    if (!board.bArea.isInThisArea(toX,toY)) return false;
    if (this.kStat.isCaptured())return true;

    if (abs(toX-this.x)+abs(toY-this.y) ==1) return true;

    return false;
  }
}