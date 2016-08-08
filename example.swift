protocol Car {
  var speed: Int { get }
  var sound: String { get }
  func drive() -> Void
}
extension Car {
  var sound: String {
    return "Wroom"
  }
  func drive() -> Void {
    print("\(self.sound) at \(self.speed) kph!")
  }
}

protocol ElectricCar: Car {}
extension ElectricCar {
  var sound: String {
    return "Humm"
  }
}

protocol FastCar: Car {}
extension FastCar {
  var speed: Int {
    return 150
  }
}

protocol Tesla: ElectricCar, FastCar {}

// <swift-specifics>
// We have to make our different cars instantiable
protocol BasicCar: Car {}
extension BasicCar {
  var speed: Int {
    return 80
  }
}
protocol BasicElectric: ElectricCar {}
extension BasicElectric {
  var speed: Int {
    return 60
  }
}
struct BasicCarInit: BasicCar {}
struct BasicElectricInit: BasicElectric {}
struct FastCarInit: FastCar {}
struct TeslaInit: Tesla {}
// </swift-specifics>

let basicCar = BasicCarInit()
let fastCar = FastCarInit()
let basicElectric = BasicElectricInit()
let tesla = TeslaInit()

basicCar.drive()       // Wroom at 80 kph!
fastCar.drive()        // Wroom at 150 kph!
basicElectric.drive()  // Humm at 60 kph!
tesla.drive()          // Humm at 150 kph!
