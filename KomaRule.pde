class KomaRule{
    /**
   ** 対象の駒が(x,y)に移動できるかどうか
   **/
  boolean canMove(Koma k, int x, int y) {
    //println("x:"+x+" y:"+y+" k.x:"+k.x+" k.y:"+k.y);
    
    //範囲外への移動の場合は無条件でダメ．範囲内であれば持ち駒はどこにでも移動可能
    if (x<0 || x>3 || y<0 || y>2) return false;
    else if(k.kStat.isCaptured()) return true;

    if (abs(x-k.x)+abs(y-k.y) ==0) return false;

    //ライオン
    if (k.name.equals("lion") && abs(x-k.x) <= 1 && abs(y-k.y) <=1) return true;

    //ひよこ
    if (k.name.equals("hiyoko")) {
      if (k.team == 0 && x-k.x==1 && y-k.y==0) return true;
      else if (k.team == 1 && k.x-x==1 && y-k.y==0) return true;
    }

    //象
    if (k.name.equals("zou") && abs(x-k.x) ==1 && abs(y-k.y) ==1) return true;

    //キリン
    if (k.name.equals("kirin") && abs(x-k.x)+abs(y-k.y) ==1) return true;
    
    //にわとり
    if(k.name.equals("niwatori")){
      if(k.team==0 && abs(x-k.x)<=1 && abs(y-k.y)<=1 && (k.x-x+abs(k.y-y))<2) return true;
      if(k.team==1 && abs(x-k.x)<=1 && abs(y-k.y)<=1 && (x-k.x+abs(k.y-y))<2) return true;
    }

    return false;
  }

}