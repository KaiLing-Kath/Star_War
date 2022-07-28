import 'dart:math';
void main(){
  sp1 spaceship1 = sp1(100, 1000);
  sp2 spaceship2 = sp2(100, 1000);

  BattleField().startBattle(spaceship1, spaceship2);
}
abstract class SpaceShip{
  double health;
  double firePower;
  SpaceShip(this.firePower,this.health);
  void hit(double firePower);
  void isDestroyed();
}
class sp1 extends SpaceShip{
  sp1(super.firePower, super.health);

  @override
  void hit(double firepower){

    AmoredSpaceShip absorb= AmoredSpaceShip();
    double hit = absorb.absordHit();
    double damage =firePower- (firepower*(hit/100));
    health = health - damage;
    print('sp1 attack sp2 with damage:$damage');
    isDestroyed();
  }
  void isDestroyed(){
    if(health<=0){
      print("Game Over >>> Space Ship 2 Win!!");
    }else{
      print("battle continue> sp1 remaining health:$health");
    }
  }
}
class sp2 extends SpaceShip{
  sp2(super.firePower, super.health);


  @override
  void hit(double firepower){
    HighSpeedSpaceShip dodge = HighSpeedSpaceShip();
    double damage;
    if (dodge.dodges()==true){
      damage = 0;
    }else {
      damage= firePower;
    }
    health = health - damage;
    print('sp2 attack sp1 with damage:$damage');
    isDestroyed();
  }

  void isDestroyed(){
    if(health<=0){
      print("Game Over >>> Space Ship 1 Win!!");
    }else{
      print("battle continue> sp2 remaining health:$health");
    }
  }
}

class BattleField{
  void startBattle(SpaceShip sp1,SpaceShip sp2 ) async{
    while(sp1.health>0  && sp2.health>0){
      await Future.delayed(Duration(seconds: 1),()
      {
        final random = Random();
        int rng = random.nextInt(2)+1;
        if (rng ==1) {
          sp1.hit(sp2.firePower);
        } else {
          sp2.hit(sp1.firePower);
        }


      });
    }
        }
      }

    //Randomly a space ship is selected to hit first
    //SpaceShips hit each other
    //Until one of them is destroyed

class AmoredSpaceShip{
  //Randomly absorbs hit
  double absordHit(){
    double maxArmorPower;
    return
        maxArmorPower = Random().nextDouble() * 40;


  }

}
class HighSpeedSpaceShip{
  //whether dodges hit or not
  bool dodges() {
    bool dodging;
    return
    dodging = Random().nextBool();

  }
}