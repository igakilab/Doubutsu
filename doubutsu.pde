static int squareSize = 100;
static int yoko = 6;
static int tate = 4;
void setup(){
  surface.setSize(yoko*squareSize,tate*squareSize);
}
 
void draw(){
  stroke(#FFFFFF);
  for(int i=0;i<yoko;i++){
    for(int j=0;j<tate;j++){
      fill(#000000);
      if(i==0 || i==yoko-1){//Mochigoma Area
        fill(#FFCCFF);
      }else if(j==tate-1){//Information Area
        fill(#55FFFF);
      }else if( ((i+j) % 2) == 1){
         fill(#FFFFFF);
      }
      rect(squareSize*i, j*squareSize, squareSize, squareSize);
    }
  }
}
 