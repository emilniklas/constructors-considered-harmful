abstract class Car {
  int speed;
  String sound = 'Wroom';
  drive () {
    print('$sound at $speed kph!');
  }
}

abstract class ElectricCar extends Object with Car {
  String sound = 'Humm';
}

class FastCar extends Object with Car {
  int speed = 150;
}

class Tesla extends Car with ElectricCar, FastCar {}

main() {
  var basicCar = new BasicCar();
  var fastCar = new FastCar();
  var basicElectric = new BasicElectric();
  var tesla = new Tesla();

  basicCar.drive();       // Wroom at 80 kph!
  fastCar.drive();        // Wroom at 150 kph!
  basicElectric.drive();  // Humm at 60 kph!
  tesla.drive();          // Humm at 150 kph!
}

// <dart-specifics>
// Dart does not support anonymous classes, so we'll have to define them
class BasicCar extends Car {
  int speed = 80;
}

class BasicElectric extends ElectricCar {
  int speed = 60;
}
// </dart-specifics>
