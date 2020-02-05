import UIKit

enum FuelType {
    case gasoline, diesel
}

enum TransmissionType {
    case manual, auto, sequental
}

enum Fullness {
    case full, half, low, empty
}

enum EngineState {
    case started, shutOff
}

enum DoorState {
    case open, closed
}

enum Color {
    
    
}






protocol Car {
    var brand: String {get set}
    var model: String {get set}
    var color: UIColor {get set}
    var engineVolume: Double { get set}
    var horsePower: Int {get set}
    var year: Int {get set}
    var fuelType: FuelType {get set}
    var transmission: TransmissionType {get set}
    var fuelAmount: Fullness {get set}
    var engineState: EngineState {get set}
    var doorState: DoorState {get set}
    
    
}

extension Car {
    func runEngine() {}
    func stopEngine() {}
    func openDoors() {}
    func closeDoors() {}
    func refuel() {}
}

class SportCar: Car {
    enum SportCarType {
        case serial, custom
    }
    
    enum TireType {
        case slick, halfSlick, regular
    }
        
    var type: SportCarType
    var tire: TireType
    
    var brand: String
    var model: String
    var color: UIColor
    var engineVolume: Double
    var horsePower: Int
    var year: Int
    var fuelType: FuelType
    var transmission: TransmissionType
    var fuelAmount: Fullness
    var engineState: EngineState
    var doorState: DoorState
    
    init(brand: String, model: String, color: UIColor, engineVolume: Double, horsePower: Int, year: Int, fuelType: FuelType, transmission: TransmissionType, fuelAmount: Fullness, engineState: EngineState, doorState: DoorState, type: SportCarType, tire: TireType) {
        self.brand = brand
        self.model = model
        self.color = color
        self.engineVolume = engineVolume
        self.horsePower = horsePower
        self.year = year
        self.fuelType = fuelType
        self.transmission = transmission
        self.fuelAmount = fuelAmount
        self.engineState = engineState
        self.doorState = doorState
        self.type = type
        self.tire = tire
        
        }

}

class TankCar: Car {
    enum TankType {
        case trailer, onChassis
    }
    
    
    var tankType: TankType
    var tankVolume: Int
    var tankFuelType: FuelType
    var tankFullness: Fullness
    
    var brand: String
    var model: String
    var color: UIColor
    var engineVolume: Double
    var horsePower: Int
    var year: Int
    var fuelType: FuelType
    var transmission: TransmissionType
    var fuelAmount: Fullness
    var engineState: EngineState
    var doorState: DoorState
    init(brand: String, model: String, color: UIColor, engineVolume: Double, horsePower: Int, year: Int, fuelType: FuelType, transmission: TransmissionType, fuelAmount: Fullness, engineState: EngineState, doorState: DoorState, tankType: TankType, tankVolume: Int, tankFuelType: FuelType, tankFullness: Fullness) {
        self.brand = brand
        self.model = model
        self.color = color
        self.engineVolume = engineVolume
        self.horsePower = horsePower
        self.year = year
        self.fuelType = fuelType
        self.transmission = transmission
        self.fuelAmount = fuelAmount
        self.engineState = engineState
        self.doorState = doorState
        self.tankType = tankType
        self.tankVolume = tankVolume
        self.tankFuelType = tankFuelType
        self.tankFullness = tankFullness
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "\(brand) \(model) year: \(year), engine: \(engineVolume) - \(horsePower) h.p."
        //return "\(brand) \(model),\(color)), year: \(year), engine: \(engineVolume) - \(horsePower) h.p." - При попытке вывести таким образом, если поставить тип UIColor, вместо цвета отображает UIExtendedSRGBColorSpace 1 1 0 1 в консоли. Насколько я понял, это не возможно сделать стандартными библиотеками или все же есть способ? Можно реализовать похожий функционал через switch, я думаю, но не совсем могу представить как
    }
    func printDescriprion() {
        print(description)
    }
}

extension TankCar: CustomStringConvertible {
    var description: String {
        return "\(brand) \(model), year: \(year), type of transported fuel: \(tankFuelType), capacity: \(tankVolume)m3, fullness: \(tankFullness)"
    }
    func printDescriprion() {
        print(description)
    }
}

var manTank = TankCar(brand: "MAN", model: "TGX", color: .black, engineVolume: 12.4, horsePower: 480, year: 2019, fuelType: .diesel, transmission: .auto, fuelAmount: .full, engineState: .shutOff, doorState: .closed, tankType: .trailer, tankVolume: 26, tankFuelType: .gasoline, tankFullness: .half)

var lamborghiniUrus2019 = SportCar(brand: "Lamborghini", model: "Urus", color: .yellow, engineVolume: 5.0, horsePower: 479, year: 2019, fuelType: .gasoline, transmission: .manual, fuelAmount: .full, engineState: .started, doorState: .closed, type: .serial, tire: .regular)





lamborghiniUrus2019.printDescriprion()
manTank.printDescriprion()


