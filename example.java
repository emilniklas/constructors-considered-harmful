interface Car {
  public int speed();
  public default String sound() {
    return "Wroom";
  };
  public default void drive() {
    System.out.println(this.sound() + " at " + this.speed() + " kph!");
  }
}

interface ElectricCar extends Car {
  public default String sound() {
    return "Humm";
  }
}

interface FastCar extends Car {
  public default int speed() {
    return 150;
  }
}

interface Tesla extends ElectricCar, FastCar {}

class Main {
  public static void main(String[] args) {
    Car basicCar = new Car() {
      public int speed() {
        return 80;
      }
    };
    Car fastCar = new FastCar() {};
    Car basicElectric = new ElectricCar() {
      public int speed() {
        return 60;
      }
    };
    Car tesla = new Tesla() {};

    basicCar.drive();       // Wroom at 80 kph!
    fastCar.drive();        // Wroom at 150 kph!
    basicElectric.drive();  // Humm at 60 kph!
    tesla.drive();          // Humm at 150 kph!
  }
}
