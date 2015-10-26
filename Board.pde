class Board {
  final int squareSize = 100;
  AbstractArea bArea;
  
  Board(){
    bArea = new BaseArea(1,0,4,3);
  }
  
  void draw(){
    bArea.draw();
  }
}