class Hero extends GameObject {
  PVector direction;
  float speed;
  Weapon myWeapon;
  int shotTimer, threshold;
  int timer;
  Hero() {
      
    super();
    speed = 5;
    roomX= 1;
    roomY= 1;
    hp=10;
    size= 40;
    timer = 60;
    shotTimer =0;
    threshold=60;
    myWeapon=new pew();
  }


  void show() {
    fill(purple);
    stroke(black);
    strokeWeight(2);
    fill(#A600AF);
    stroke(#030203);
    circle(loc.x, loc.y, size);
  }

  void act() {


    super.act();
    
    shotTimer++;
    if (w) velocity.y = -speed;
    if (a) velocity.x = -speed;
    if (s) velocity.y = speed;
    if (d) velocity.x = speed;

    if (velocity.mag() > speed)
      velocity.setMag(speed);


    if (!w && !s) velocity.y = velocity.y * 0.75;
    if (!a && !d) velocity.x = velocity.x * 0.75;


    if (northRoom != #FFFFFF && loc.y == height*0.1 && loc.x >= width/2-50 && loc.x<= width/2+50) {
      roomY--;
      loc = new PVector(width/2, height*0.9-10);
    }
    if (eastRoom != #FFFFFF && loc.x == width*0.9 && loc.y >= height/2-50 && loc.y <= height/2+50) {
      roomX++;
      loc = new PVector(width*0.1+10, height/2);
    }
    if (southRoom != #FFFFFF && loc.y == height*0.9 && loc.x >= width/2-50 && loc.x<= width/2+50) {
      roomY++;
      loc = new PVector(width/2, height*0.1 +10);
    } 
    if (westRoom != #FFFFFF && loc.x == width*0.1 && loc.y >= height/2-50 && loc.y <= height/2+50) {
      roomX--;
      loc = new PVector(width*0.9-10, height/2);
    } 

    myWeapon.update();
    if (keyPressed) if (key == 'p') {
      myWeapon.shoot();
    } 
    timer++;
   int i=0;
    while (i < myObject.size()) {
      GameObject obj = myObject.get(i);
      if (obj instanceof enemyBullet) {
       
        float d = dist(obj.loc.x, obj.loc.y, loc.x, loc.y);
        if (d <= size/2 + obj.size/2) {
         if(roomX==obj.roomX && roomY == obj.roomY){
           if(timer >= threshold){
        hp=hp-1;
        timer=0;
        print(hp);
          //  hp= hp -((heroBullet) obj).dam;
           }
           }
         }
        }
      }
      i++;
    }
     
    while (i < myObject.size()) {
      GameObject obj = myObject.get(i);
      if (obj instanceof Enemy) {
        float d = dist(obj.loc.x, obj.loc.y, loc.x, loc.y);
        if (d <= size/2 + obj.size/2) {
         if(roomX==obj.roomX && roomY == obj.roomY){
           if(timer >= threshold){
        hp=hp-1;
        timer=0;
        print(hp);
          //  hp= hp -((heroBullet) obj).dam;
           }
         }
        }
      }
      i++;
    }
    // if (mousePressed && shotTimer >= threshold) {
    //   myObject.add(new heroBullet());
    //    shotTimer =0;
    //   }
 
    
     
    }
  }
