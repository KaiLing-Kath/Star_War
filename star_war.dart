import 'dart:math';
void main(){
  sp1 spaceship1 = sp1(100, 1000);
  sp2 spaceship2 = sp2(1000, 200);

  AmoredSpaceShip absorb= AmoredSpaceShip();
  HighSpeedSpaceShip dodge = HighSpeedSpaceShip();
  //absord hit
  absorb.absordHit();
  //dodge hit
  dodge.dodges();

  BattleField battlefield= BattleField();
  battlefield.startBattle(spaceship1, spaceship2);


}
abstract class SpaceShip{
  int health;
  int firePower;
  SpaceShip(this.firePower,this.health);
  void hit(int firePower);
  void isDestroyed();
}
class sp1 extends SpaceShip{
  sp1(super.firePower, super.health);

  @override
  void hit(int firepower){
    health = health - firePower;
  }
  void isDestroyed(){
    if(health==0){
      print("Game Over >>> Space Ship 2 Win!!");
    }else{
      print("battle continue...");
    }
  }
}
class sp2 extends SpaceShip{
  sp2(super.firePower, super.health);


  @override
  void hit(int firepower){
    health = health - firePower;
  }
  void isDestroyed(){
    if(health==0){
      print("Game Over >>> Space Ship 1 Win!!");
    }else{
      print("battle continue...");
    }
  }
}

class BattleField{
  void startBattle(SpaceShip sp1,SpaceShip sp2 ){
    List listOfSP =["sp1","sp2"];
    final _random =Random();
    var selectSP =listOfSP[_random.nextInt(listOfSP.length)];
    print(selectSP);

    if (selectSP ==sp1){
      while(true){
        if (sp1.health==0 && sp1.health>0){
          sp1.hit(sp2.firePower);
          print("continue> sp1");}
        else if (sp2.health!=0 && sp2.health>0){
          sp2.hit(sp1.firePower);
          print("continue>sp2");}
        else{
          if(sp1.health==0){
            print("Space ship 2 win");
            break;
          }else{
            print("Space ship 1 win");
            break;
          }

        }
        }
    }else{
      while(true){
        if (sp2.health!=0 && sp2.health>0){
          sp2.hit(sp1.firePower);
          print("continue>sp2");}
        else if (sp1.health!=0){
          sp1.hit(sp2.firePower);
          print("continue> sp1");}
        else{
          if(sp1.health==0 && sp1.health>0){
            print("Space ship 2 win");
            break;
          }else{
            print("Space ship 1 win");
            break;
          }

        }
      }
    }








    //Randomly a space ship is selected to hit first
    //SpaceShips hit each other
    //Until one of them is destroyed


  }
}
class AmoredSpaceShip{
  //Randomly absorbs hit
  void absordHit(){
    double maxArmorPower = Random().nextDouble() * 40;
  print(maxArmorPower);
  }

}
class HighSpeedSpaceShip{
  //whether dodges hit or not
  void dodges() {
    bool dodging = Random().nextBool();
    print(dodging);
  }
}