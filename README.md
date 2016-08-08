# Examples of constructorless composition in different languages

See [this article](https://medium.com/@emilniklas/17cccfab8d3) for details.

> **Disclaimer:** I know the code in this repo is all but idiomatic code in
> the different languages. This is intentional, as it aims to look as close
> to the below as possible.

Here is the objective in psuedo code:

```
class Car {
  speed: Int
  sound = "Wroom"
  drive () {
    print("{this.sound} at {this.speed} kph!")
  }
}

class ElectricCar: Car {
  sound = "Humm"
}

class FastCar: Car {
  speed = 150
}

class Tesla: ElectricCar, FastCar

basicCar = new Car {
  speed = 80
}
fastCar = new FastCar {}
basicElectric = new ElectricCar {
  speed = 60
}
tesla = new Tesla {}

basicCar.drive()       // Wroom at 80 kph!
fastCar.drive()        // Wroom at 150 kph!
basicElectric.drive()  // Humm at 60 kph!
tesla.drive()          // Humm at 150 kph!
```
