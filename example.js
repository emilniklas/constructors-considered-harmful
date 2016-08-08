const Car = {
  sound: 'Wroom',
  drive () {
    console.log(`${this.sound} at ${this.speed} kph!`)
  }
}

const ElectricCar = mix(Car, {
  sound: 'Humm'
})

const FastCar = mix(Car, {
  speed: 150
})

const Tesla = mix(ElectricCar, FastCar, {})

const basicCar = mix(Car, {
  speed: 80
})
const fastCar = mix(FastCar, {})
const basicElectric = mix(ElectricCar, {
  speed: 60
})
const tesla = mix(Tesla, {})

basicCar.drive()       // Wroom at 80 kph!
fastCar.drive()        // Wroom at 150 kph!
basicElectric.drive()  // Humm at 60 kph!
tesla.drive()          // Humm at 150 kph!

// <js-specifics>
// Utility
function mix () {
  const args = Array.prototype.slice.call(arguments)
  const instance = args.pop()
  const mixins = args
  for (let mixin of mixins) {
    for (let prop in mixin) {
      if (instance[prop] === undefined && mixin.hasOwnProperty(prop)) {
        instance[prop] = mixin[prop]
      }
    }
  }
  return instance
}
// </js-specifics>
