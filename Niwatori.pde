class Niwatori extends AbstractKoma {

  Niwatori(String name, int x, int y, int team, boolean active) {
    super(name, x, y, team, active);
  }

  boolean canMove(int toX, int toY) {
    if (!board.bArea.isInThisArea(toX,toY)) return false;
    if (this.kStat.isCaptured())return true;

    if (this.team==0 && abs(x-this.x)<=1 && abs(y-this.y)<=1 && (this.x-x+abs(this.y-y))<2) return true;
    if (this.team==1 && abs(x-this.x)<=1 && abs(y-this.y)<=1 && (x-this.x+abs(this.y-y))<2) return true;

    return false;
  }
  
  void captured(){
    super.captured();
    komaList.demote(this);
  }
}