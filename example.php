<?php

trait Car {
  abstract function speed(): int;
  function sound(): string { return 'Wroom'; }
  function drive() {
    echo "{$this->sound()} at {$this->speed()} kph!\n";
  }
}

trait ElectricCar { use Car;
  function sound(): string { return 'Humm'; }
}

trait FastCar { use Car;
  function speed(): int { return 150; }
}

trait Tesla {
  use FastCar;
  // PHP doesn't allow this because of methods colliding,
  // so we'll have to reimplement the electric car here,
  // but you get the picture.
  /* use ElectricCar; */
  function sound(): string { return 'Humm'; }
}

$basicCar = new class { use Car;
  function speed(): int { return 80; }
};
$fastCar = new class { use FastCar; };
$basicElectric = new class {
  use ElectricCar;

  function speed(): int {
    return 80;
  }
};
$tesla = new class { use Tesla; };

$basicCar->drive();       // Wroom at 80 kph!
$fastCar->drive();        // Wroom at 150 kph!
$basicElectric->drive();  // Humm at 60 kph!
$tesla->drive();          // Humm at 150 kph!
