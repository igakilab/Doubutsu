class Board {
  final int squareSize = 100;
  AbstractArea bArea;
  AbstractArea[] mArea = new MochigomaArea[2];
  AbstractArea iArea;
  
  Board(){
    bArea = new BaseArea(1,0,4,3);
    mArea[0] = new MochigomaArea(0,0,1,4);
    mArea[1] = new MochigomaArea(5,0,1,4);
    iArea = new InfoArea(1,3,4,1);
  }
  
  void draw(){
    bArea.draw();
    mArea[0].draw();
    mArea[1].draw();
    iArea.draw();
  }
  
  void select(int x, int y){
    AbstractKoma koma = komaList.getSelectedKoma();
    if(koma==null){
      komaList.select(x,y);
    }else{
      koma.move(x,y);
      koma.kStat.selected=false;
    }
  }
}