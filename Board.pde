class Board {
  final int squareSize = 100;
  AbstractArea bArea;
  AbstractArea[] mArea = new MochigomaArea[2];
  
  Board(){
    bArea = new BaseArea(1,0,4,3);
    mArea[0] = new MochigomaArea(0,0,1,4);
    mArea[1] = new MochigomaArea(5,0,1,4);
  }
  
  void draw(){
    bArea.draw();
    mArea[0].draw();
    mArea[1].draw();
  }
}