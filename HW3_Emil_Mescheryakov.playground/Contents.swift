import UIKit

enum VehicleType { // общее для всех типов создаваемых машин - определяет, какого типа автомобиль
    case truck, car
}

struct Mazda { //легковой автомобиль - мазда (модель, объем двигателя, количество дверей (для хетчбека возможны варианты 3,5 дверей), тип кузова, состояние дверей (открыры/закрыты), состояние двигателя (запущен/не запущен)
    enum Model {
        case Mazda2, Mazda3, Mazda5, Mazda6, CX_5, C_7, CX_9, MPV
    }
    
    enum EngineCapacity: Double {
        case onePFive = 1.5
        case onePSix = 1.6
        case onePEight = 1.8
        case twoPZero = 2.0
        case twoPFive = 2.5
    }
    
    enum NumberOfDoors {
        case three, five
    }
    
    enum BodyType {
        case sedan, hatchback, crossover, SW
    }
    
    enum DoorState {
        case open, close
    }
    
    enum EngineState {
        case turnedOff, started
    }
    
    
    var type: VehicleType = .car
    var model: Model
    var engine: EngineCapacity
    var color: UIColor
    var body: BodyType
    var doors: NumberOfDoors
    var doorState: DoorState
    var engineState: EngineState
    
    mutating func openDoor () {
        self.doorState = .open
    }
    
    mutating func closeDoor () {
        self.doorState = .close
    }
    
    mutating func engineOff () {
        self.engineState = .turnedOff
    }
    
    mutating func engineOn () {
        self.engineState = .started
    }
}

struct Volvo { //грузовой автомобиль
    
    enum Model {
        case FH, FH16, FMX, FM, FE, FL, FH_LNG
    }
    
    enum BodyType {
        case bus, dumpTruck, chassis, tank, tractor, flatbedTruck
    }
    
    enum DoorState {
        case open, close
    }
    
    enum EngineState {
        case turnedOff, started
    }
    
    enum Fullness {
        case full, half, empty
    }
    
    var type: VehicleType = .truck
    var model: Model
    var weight: Int
    var carryingCapacity: Int
    var bodyType: BodyType
    var numberOfWheels: Int
    var bodyFullness: Fullness
    var engineState: EngineState
    var doorState: DoorState
    
    mutating func openDoor () {
        self.doorState = .open
    }
    
    mutating func closeDoor () {
        self.doorState = .close
    }
    
    mutating func engineOff () {
        self.engineState = .turnedOff
    }
    
    mutating func engineOn () {
        self.engineState = .started
    }
    
    mutating func halfLoad () {
        self.bodyFullness = .half
    }
    
    mutating func fullLoad () {
        self.bodyFullness = .full
    }
    
    mutating func unLoad () {
        self.bodyFullness = .empty
    }
    
}





var mazdaMazda3Blue = Mazda(model: .Mazda3, engine: .onePSix, color: .blue, body: .sedan, doors: .five, doorState: .close, engineState: .started)

func mazdaInfo(_ car: Mazda) {
    var color: String
    switch car.color {
    case .black:
        color = "черный"
    case .white:
        color = "белый"
    case .blue:
        color = "синий"
    case .brown:
        color = "коричневый"
    case .cyan:
        color = "сине-зеленый"
    case .darkGray:
        color = "темно серый"
    case .green:
        color = "зеленый"
    case .red:
        color = "красный"
    case .purple:
        color = "фиолетовый"
    case .yellow:
        color = "желтый"
    default:
        color = "белый"
    }
    
    var body: String
    switch car.body {
    case .crossover:
        body = "кросовер"
    case .sedan:
        body = "седан"
    case .hatchback:
        body = "хетчбек"
    case .SW:
        body = "универсал"
    }
    
    var doorState: String
    switch car.doorState {
    case .close:
        doorState = "закрыты"
    case .open:
        doorState = "открыты"
    }
    
    var engineState: String
    switch car.engineState {
    case .started:
        engineState = "запущен"
    case .turnedOff:
        engineState = "заглушен"
    }
    
    var engineVolume: String
    switch car.engine {
    case .onePEight:
        engineVolume = "1.8"
    case .onePFive:
        engineVolume = "1.5"
    case .onePSix:
        engineVolume = "1,6"
    case .twoPFive:
        engineVolume = "2,5"
    case .twoPZero :
        engineVolume = "2.0"
    }
    
    print("Автомобиль \(car.model):\n Двигатель: \(engineVolume)L\n Цвет: \(color)\n Тип кузова: \(body)\n Состояние дверей -  \(doorState)\n Состояние двигателя - \(engineState)\n\n")
}

func volvoInfo (truck: Volvo) {
    var type: String
    switch truck.bodyType {
    case .bus:
        type = "Автобус"
    case .chassis:
        type = "Шасси"
    case .dumpTruck:
        type = "Самосвал"
    case .flatbedTruck:
        type = "Бортовой грузовик"
    case .tank:
        type = "Цистерна"
    case .tractor:
        type = "Тягач"
    }
    
    var bodyLoad: String
    switch truck.bodyFullness {
    case .full:
        bodyLoad = "полный"
    case .half:
        bodyLoad = "загружен на половину"
    case .empty:
        bodyLoad = "пустой"
    }
    
    var engineState: String
    switch truck.engineState {
    case .started:
        engineState = "запущен"
    case .turnedOff:
        engineState = "заглушен"
    }
    
    var doorState: String
    switch truck.doorState {
    case .close:
        doorState = "закрыты"
    case .open:
        doorState = "открыты"
    }
    
    print("\(type) Volvo:\n Модель: \(truck.model)\n Масса: \(truck.weight) тонн\n Грузоподъемность: \(truck.carryingCapacity) тонн\n Количество колёс: \(truck.numberOfWheels)\n Кузов - \(bodyLoad)\n Двигатель \(engineState)\n Двери - \(doorState)\n\n")
}

mazdaInfo(mazdaMazda3Blue) //вывод информации о легковой машине в консоль


let volvoFH16 = Volvo(type: .truck, model: .FH16, weight: 16, carryingCapacity: 25, bodyType: .dumpTruck, numberOfWheels: 8, bodyFullness: .empty, engineState: .started, doorState: .open)

volvoInfo(truck: volvoFH16) //вывод информации о грузовой машине в консоль

//добавлю willSet/didSet, чтобы реагировало на загрузку кузова грузовика или на открытие/закрытие дверей, но вне зачета. К уроку не успеваю
