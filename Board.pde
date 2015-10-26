class Board {
  final int squareSize = 100;
  AbstractArea bArea;
  AbstractArea[] mArea = new MochigomaArea[2];
  
  Board(){
    bArea = new BaseArea(1,0,4,3);
  }
  
  void draw(){
    bArea.draw();
  }
}