class Hiyoko extends AbstractKoma {

  Hiyoko(String name, int x, int y, int team) {
    super(name, x, y, team);
  }

  boolean canMove(int toX, int toY) {

    if (toX<board.bArea.posX || toX>=board.bArea.posX+board.bArea.yoko || toY<board.bArea.posY || toY>=board.bArea.posY+board.bArea.tate) return false;
    else if (this.kStat.isCaptured())return true;

    if (this.team == 0 && toX-this.x==1 && toY-this.y==0) return true;
    else if (this.team == 1 && this.x-toX==1 && toY-this.y==0) return true;

    return false;
  }
  
  void updatePos(int toX, int toY) {
    if(this.team==0 && !this.kStat.captured){
      if(toX==board.bArea.posX+board.bArea.yoko-1) komaList.promote(this,toX,toY);
    }else if(this.team==1 && !this.kStat.captured){
      if(toX==board.bArea.posX) komaList.promote(this,toX,toY);
    }
    super.updatePos(toX,toY);
  }
}