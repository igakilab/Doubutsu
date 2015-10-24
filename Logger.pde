class Logger{
  void printKomaList(){
    println("------------------");
    for(AbstractKoma koma:komaList.komaArray){
      print(koma.name+koma.team+"(x,y)="+koma.x+","+koma.y+"captured:"+koma.kStat.captured+";");
    }
    println();
    println("------------------");
  }
}