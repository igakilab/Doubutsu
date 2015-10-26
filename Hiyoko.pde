class Hiyoko extends AbstractKoma {

  Hiyoko(String name, int x, int y, int team) {
    super(name, x, y, team);
  }

  boolean canMove(int toX, int toY) {

    if (!board.bArea.isInThisArea(toX,toY)) return false;
    if (this.kStat.isCaptured())return true;

    if (this.team == 0 && toX-this.x==1 && toY-this.y==0) return true;
    else if (this.team == 1 && this.x-toX==1 && toY-this.y==0) return true;

    return false;
  }
  
}