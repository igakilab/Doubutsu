class Niwatori extends AbstractKoma {

  Niwatori(String name, int x, int y, int team, boolean active) {
    super(name, x, y, team, active);
  }
  
  boolean canMove(int toX, int toY) {
    if (!board.bArea.isInThisArea(toX,toY)) return false;

    if (this.team==0 && abs(toX-this.x)<=1 && abs(toY-this.y)<=1 && (this.x-toX+abs(this.y-toY))<2) return true;
    if (this.team==1 && abs(toX-this.x)<=1 && abs(toY-this.y)<=1 && (toX-this.x+abs(this.y-toY))<2) return true;

    return false;
  }
}