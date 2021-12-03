class Enemy extends GameObject {
   
  Enemy() {
    loc= new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    hp= 100;
    roomX= 1;
    size=50;
    roomY = 1;
  }
    Enemy(int x, int y) {
    loc= new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    hp= 100;
    roomX= x;
    size=50;
    roomY = y;
  }
  Enemy(int _hp, int s, int x, int y) {
    loc= new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    hp= _hp;
    roomX= x;
    size=s;
    roomY = y;
  }


  void show() {
    if (roomX==myHero.roomX && roomY == myHero.roomY) {

      stroke(black);
      strokeWeight(2);
      fill (green);
      circle(loc.x, loc.y, size);
      fill(black);
      textSize(20);
      text(hp, loc.x, loc.y);
    }
  }

  void act() {
 
    super.act();

    int i=0;
    while (i < myObject.size()) {
      GameObject obj = myObject.get(i);
      if (obj instanceof heroBullet) {
        float d = dist(obj.loc.x, obj.loc.y, loc.x, loc.y);
         if(roomX==obj.roomX && roomY == obj.roomY){
        if (d <= size/2 + obj.size/2) {
          hp= hp - int(obj.velocity.mag());
          //  hp= hp -((heroBullet) obj).dam;
          obj.hp= 0;
        }
         }
      }
      i++;
    }
  }
}
