class enemyBullet extends GameObject {
  int shotTimer, threshold;
  //  int lives;
  //  PVector loc;
  // PVector velocity;
  PVector direction;
  int timer;
  color bulletc;
  int dam;

  enemyBullet(color c, int s, float x, float y) {

    loc = new PVector(x, y);   
    velocity = new PVector(myHero.loc.x - loc.x, myHero.loc.y- loc.y);
    bulletc = c;
    velocity.setMag(10);
    timer = 60;
    hp = 1;
    threshold = 30;
    size = s ;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    //loc = new PVector(myUFO.loc.x, myUFO.loc.y);
    //  velocity = new PVector(myShip.direction.x, myShip.direction.y);



    //if(spacekey){







    // }
    //velocity = new PVector(myShip.loc.x, myShip.loc.y);
    // velocity.setMag(10);
    //size = 10;
  }


  void show() {

    stroke(255);
    noFill();
    ellipse(loc.x, loc.y, size, size);
  }

  void act() {
    //  loc.add(velocity);

    ///  if (loc.y < -50) loc.y = height+50;
    //  if (loc.y > height +50)loc.y = -50;
    // if(loc.x < -50) loc.x = width+50;
    // if (loc.x > width+50) loc.x = -50;
    loc.add(velocity);

    if (loc.x < width*0.1) {
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      loc.x = hp = 0;
    }
    if (loc.x > width*0.9) {
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      loc.x = hp = 0;
    }
    if (loc.y < height*0.1) {
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      loc.x = hp = 0;
    }
    if (loc.y > height*0.9) {
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      loc.x = hp = 0;
    }

    timer --;
    if (timer == 0) {
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      myObject.add(new Blast(loc.x, loc.y));
      hp = 0;
    }
  }
}
