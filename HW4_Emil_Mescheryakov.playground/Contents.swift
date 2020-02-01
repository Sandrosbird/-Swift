import UIKit


class Car {
    
    func uniqueFunc() {
        
    }
    
    func openDoors() {
        self.doorState = .open
    }
    
    func closeDoors() {
        self.doorState = .closed
    }
    
    func runEngine() {
        self.engineState = .turnedOn
    }
    
    func shutOffEngine()  {
        self.engineState = .turnedOff
    }
    
    func refuel() {
        self.fuelAmount = .full
    }
    
    enum CarModel {
        case ford, dodge, gmc, bmw, toyota, honda, porsche
    }
    
    enum FuelType {
        case diesel, gas, benzine
    }
    
    enum TransmissionType {
        case auto, manual
    }
    
    enum EngineState {
        case turnedOn, turnedOff
    }
    
    enum DoorState {
        case open, closed
    }
    
    enum FuelAmount {
        case empty, low, half, full
    }
    
    var model: CarModel
    var color: UIColor
    var engineVolume: Double
    var horsePower: Int
    var year: Int
    var fuelType: FuelType
    var transmission: TransmissionType
    var engineState: EngineState
    var doorState: DoorState
    var fuelAmount: FuelAmount
    
    
    init(model: CarModel, color: UIColor, engineVolume: Double, horsePower: Int, year: Int, fuelType: FuelType, transmission: TransmissionType, engineState: EngineState, doorState: DoorState, fuelAmount: FuelAmount) {
        self.model = model
        self.color = color
        self.engineVolume = engineVolume
        self.horsePower = horsePower
        self.year = year
        self.fuelType = fuelType
        self.transmission = transmission
        self.engineState = engineState
        self.doorState = doorState
        self.fuelAmount = fuelAmount
    }
}

class TrunkCar: Car {
    enum CarInfoMode {
        case full, main, short
    }
    
    func printCarInfo(car: TrunkCar, mode: CarInfoMode)  {
        switch mode {
        case .full:
            print("Пикап \(model)\nЦвет: \(color)\nОбъем двигателя: \(engineVolume)\nМощность: \(horsePower)\nГод выпуска: \(year)\nТип топлива: \(fuelType)\nКоробка передач: \(transmission)\nТолпивный бак: \(fuelAmount)\nГрузоподъемность: \(carryingCapacity)\nОбъем кузова: \(trunkVolume)\n")
        case .main:
            print("Пикап \(model)\nОбъем двигателя: \(engineVolume)\nМощность: \(horsePower)\nТип топлива: \(fuelType)\nТолпивный бак: \(fuelAmount)\nГрузоподъемность: \(carryingCapacity)\n")
        case .short:
            print("Пикап \(model)Год выпуска: \(year)\nКоробка передач: \(transmission)\nГрузоподъемность: \(carryingCapacity)\n")
        }
    }
    
    
    override func uniqueFunc() {
        switch self.trunkState {
        case .closed:
            self.trunkState = .open
        case .open:
            self.trunkState = .closed
        }
        
    }
    
    enum TrunkType {
        case covered, uncovered
    }
    
    enum TrunkState {
        case open, closed
    }
    
    var carryingCapacity: Int
    var trunkVolume: UInt
    var trunkType: TrunkType //я так понимаю, trunk = пикап? если так, то тип - это про то, открытый он или закрытый - для каждого пикапа есть закрывающий как кожух что ли, вот про него и речь :)
    var trunkState: TrunkState //определяет, открыт или закрыт откидной борт
    
    
    
    init(model: CarModel, color: UIColor, engineVolume: Double, horsePower: Int, year: Int, fuelType: FuelType, transmission: TransmissionType, engineState: EngineState, doorState: DoorState, fuelAmount: FuelAmount, carryingCapacity: Int, trunkVolume: UInt, trunkType: TrunkType, trunkState: TrunkState) {
        self.carryingCapacity = carryingCapacity
        self.trunkVolume = trunkVolume
        self.trunkType = trunkType
        self.trunkState = trunkState
        super.init(model: model, color: color, engineVolume: engineVolume, horsePower: horsePower, year: year, fuelType: fuelType, transmission: transmission, engineState: engineState, doorState: doorState, fuelAmount: fuelAmount)
    }
}



class SportCar: Car {
    
    enum CarInfoMode {
        case full, main, short
    }
    
    func printCarInfo(car: SportCar, mode: CarInfoMode)  {
        switch mode {
        case .full:
            print("Спорткар \(model)\nЦвет: \(color)\nОбъем двигателя: \(engineVolume)\nМощность: \(horsePower)\nГод выпуска: \(year)\nКоробка передач: \(transmission)\nТолпивный бак: \(fuelAmount)\nМаксимальная скорость: \(maxSpeed)\nВремя разгона до 100 км/ч: \(timeToHundred)\nТип модели: \(type)\nТип шин: \(tireType)\nТип спойлера: \(spoiler)")
        case .main:
            print("Спорткар \(model)\nОбъем двигателя: \(engineVolume)\nМощность: \(horsePower)\nМаксимальная скорость: \(maxSpeed)\nВремя разгона до 100 км/ч: \(timeToHundred)\nТип модели: \(type)\nТип шин: \(tireType)\n")
        case .short:
            print("Спорткар \(model)\nМощность: \(horsePower)\nКоробка передач: \(transmission)\nМаксимальная скорость: \(maxSpeed)\nВремя разгона до 100 км/ч: \(timeToHundred)\n")
        }
    }
    
    enum SportCarType {
        case serial, custom
    }
    
    enum TireType {
        case slick, half_slick, casual
    }
    
    enum BodyType {
        case coupe, roadster
    }
    
    enum SpoilerType {
        case ducktail, wing
    }
    
    var speed: Int = 0
    var maxSpeed: Int
    var timeToHundred: Double
    var type: SportCarType
    var tireType: TireType
    var bodyType: BodyType
    var spoiler: SpoilerType
    
    override func uniqueFunc() {
        switch spoiler {
        case .ducktail:
            self.spoiler = .wing
        case .wing:
            self.spoiler = .ducktail
        }
    }
    
    func getMaxSpeed() {
        self.speed = self.maxSpeed
    }
    
    init(model: CarModel, color: UIColor, engineVolume: Double, horsePower: Int, year: Int, fuelType: FuelType, transmission: TransmissionType, engineState: EngineState, doorState: DoorState, fuelAmount: FuelAmount, speed: Int, maxSpeed: Int, timeToHundred: Double, type: SportCarType, tireType: TireType, bodyType: BodyType, spoiler: SpoilerType) {
        self.speed = speed
        self.maxSpeed = maxSpeed
        self.timeToHundred = timeToHundred
        self.type = type
        self.tireType = tireType
        self.bodyType = bodyType
        self.spoiler = spoiler
        super.init(model: model, color: color, engineVolume: engineVolume, horsePower: horsePower, year: year, fuelType: fuelType, transmission: transmission, engineState: engineState, doorState: doorState, fuelAmount: fuelAmount)
    }
    
    
//не переопределяется свойство
//var transmission: SportTransmission {
//        get {
//            return self.transmission
//        }
//        set {
//            self.transmission = newValue
//        }
//    }
}


var ford = TrunkCar(model: .ford, color: .black, engineVolume: 2.5, horsePower: 150, year: 2005, fuelType: .diesel, transmission: .manual, engineState: .turnedOn, doorState: .closed, fuelAmount: .low, carryingCapacity: 950, trunkVolume: 80, trunkType: .covered, trunkState: .closed)
print("Откидной борт \(ford.trunkState)\n")
ford.uniqueFunc() //открываем борт
print("Откидной борт \(ford.trunkState)\n")
ford.printCarInfo(car: ford, mode: .main) //можно вынести и переопределять в каждом дочернем классе, не сразу сообразил :)


var bmw = SportCar(model: .bmw, color: .red, engineVolume: 5.7, horsePower: 455, year: 2019, fuelType: .benzine, transmission: .manual, engineState: .turnedOff, doorState: .closed, fuelAmount: .full, speed: 0, maxSpeed: 359, timeToHundred: 2.8, type: .serial, tireType: .half_slick, bodyType: .roadster, spoiler: .wing)
bmw.getMaxSpeed()
print("Скорость \(bmw.speed)")
bmw.printCarInfo(car: bmw, mode: .short) //можно вынести и переопределять в каждом дочернем классе, не сразу сообразил :)
