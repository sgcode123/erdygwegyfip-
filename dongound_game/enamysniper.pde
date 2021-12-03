class sniper extends Enemy{
  
 sniper(int x, int y){
    super(100, 50,x,y);
    
    }
    void show() {
    if (roomX==myHero.roomX && roomY == myHero.roomY) {

      stroke(black);
      strokeWeight(2);
      fill (blue);
      circle(loc.x, loc.y, size);
      fill(black);
      textSize(20);
      text(hp, loc.x, loc.y);
    }
  }
  void act(){
    super.act();
     float d = dist(myHero.loc.x, myHero.loc.y, loc.x, loc.y);
      
        if (d <= size*2 + myHero.size*2) {
    velocity = new PVector(myHero.loc.x-loc.x,myHero.loc.y-loc.y);
     velocity.setMag(3);
        }
        
  }
}
