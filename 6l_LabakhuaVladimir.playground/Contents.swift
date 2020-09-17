import UIKit

//Задание 1
//Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

protocol Car {
    var color: UIColor { get set }
    var yearOfIssue: UInt { get set }
    var trunkValue: UInt { get set }
    var engineIsOn: Bool { get set }
    var windowsIsOpen: Bool { get set }
    var filledTrunkVolume: Int { get set }
}

extension Car {
    mutating func openWindow() {
        self.windowsIsOpen = true
        print("Окна открыты")
    }
}

extension Car {
    mutating func closeWindow() {
        self.windowsIsOpen = false
        print("Окна закрыты")
    }
}

extension Car {
    mutating func startEngine() {
        self.engineIsOn = true
        print("Двигатель запущен")
    }
}

extension Car {
    mutating func stopEngine() {
        self.engineIsOn = false
        print("Двигатель заглушен")
    }
}

extension Car {
    mutating func loadCargo(cargoVolume: Int) {
        print("Вы собираетесь положить \(cargoVolume) груза в кузов.")
        let guardCargo = self.filledTrunkVolume + cargoVolume
        guard  guardCargo < trunkValue else {
            return print("Вы не можете положить этот груз, в кузове недостаточно места \nОперация не будет выполнена!")
        }
        self.filledTrunkVolume += cargoVolume
        print("После погрузки груза в кузове стало \(guardCargo) груза")
    }
}

extension Car {
    mutating func unloadCargo(cargoVolume: Int) {
        print("Вы собираетесь выгрузить \(cargoVolume) груза из кузова.")
        let guardCargo = self.filledTrunkVolume - cargoVolume
        guard  guardCargo > 0 else {
           return print("Вы не можете выгрузить этот груз, в кузове его недостаточно \nОперация не будет выполнена!")
        }
        self.filledTrunkVolume -= cargoVolume
        print("После выгрузки груза в кузове осталось \(guardCargo) груза")
    }
}

class SportCar: Car {
    var color: UIColor
    var yearOfIssue: UInt
    var trunkValue: UInt
    var engineIsOn: Bool
    var windowsIsOpen: Bool
    var filledTrunkVolume: Int
    
    var maxSpeed: UInt
    var spoiler: Bool
    var turbo: Bool
    
    init(color: UIColor, yearOfIssue: UInt, trunkValue: UInt, engineIsOn: Bool, windowsIsOpen: Bool, filledTrunkVolume: Int, maxSpeed: UInt, spoiler: Bool, turbo: Bool) {
        self.color = color
        self.yearOfIssue = yearOfIssue
        self.trunkValue = trunkValue
        self.engineIsOn = engineIsOn
        self.windowsIsOpen = windowsIsOpen
        self.filledTrunkVolume = filledTrunkVolume
        self.maxSpeed = maxSpeed
        self.spoiler = spoiler
        self.turbo = turbo
    }
}
extension SportCar: CustomStringConvertible {
    var description: String {
        return "Спортивный автомобиль \(yearOfIssue) года выпуска \nМаксимальная скорость - \(maxSpeed) \nМаксимальной вместительностью \(trunkValue) груза \nДвигатель запущен - \(engineIsOn) \nОкна открыты - \(windowsIsOpen)\nИмеет спойлер - \(spoiler) \nИмеет турбо - \(turbo) "
    }
}

class TrunkCar: Car {
    var color: UIColor
    var yearOfIssue: UInt
    var trunkValue: UInt
    var engineIsOn: Bool
    var windowsIsOpen: Bool
    var filledTrunkVolume: Int
    
    var rangeOnOneTank: UInt
    var hydraulicLift: Bool
    var refrigerator: Bool
    
    init(color: UIColor, yearOfIssue: UInt, trunkValue: UInt, engineIsOn: Bool, windowsIsOpen: Bool, filledTrunkVolume: Int, rangeOnOneTank: UInt, hydraulicLift: Bool, refrigerator: Bool) {
        self.color = color
        self.yearOfIssue = yearOfIssue
        self.trunkValue = trunkValue
        self.engineIsOn = engineIsOn
        self.windowsIsOpen = windowsIsOpen
        self.filledTrunkVolume = filledTrunkVolume
        self.rangeOnOneTank = rangeOnOneTank
        self.hydraulicLift = hydraulicLift
        self.refrigerator = refrigerator
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Грузовой автомобиль \(yearOfIssue) года выпуска \nДальность поездки на одном баке - \(rangeOnOneTank) \nМаксимальной вместительностью \(trunkValue) груза \nДвигатель запущен - \(engineIsOn) \nОкна открыты - \(windowsIsOpen) \nИмеет гидравлический лифт - \(hydraulicLift) \nИмеет холодильную установку - \(refrigerator)"
    }
}

struct queue<T> {
    private var elements: [T] = []
    mutating func add(_ element: T) {
        elements.append(element)
    }
    mutating func delet() -> T? {
        return elements.removeFirst()
    }
}

//Задание 2
//Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)



//Задание 3*
//Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.



var garage = queue<SportCar>()

garage.add(SportCar(color: .black, yearOfIssue: 1999, trunkValue: 300, engineIsOn: true, windowsIsOpen: true, filledTrunkVolume: 15, maxSpeed: 200, spoiler: true, turbo: true))
garage.add(SportCar(color: .red, yearOfIssue: 2020, trunkValue: 150, engineIsOn: false, windowsIsOpen: false, filledTrunkVolume: 24, maxSpeed: 300, spoiler: false, turbo: true))
garage.add(SportCar(color: .blue, yearOfIssue: 2007, trunkValue: 230, engineIsOn: true, windowsIsOpen: false, filledTrunkVolume: 20, maxSpeed: 240, spoiler: true, turbo: false))
garage.add(SportCar(color: .red, yearOfIssue: 2014, trunkValue: 400, engineIsOn: false, windowsIsOpen: true, filledTrunkVolume: 45, maxSpeed: 170, spoiler: false, turbo: false))


var truckStation = queue<TrunkCar>()

truckStation.add(TrunkCar(color: .black, yearOfIssue: 1993, trunkValue: 20000, engineIsOn: false, windowsIsOpen: false, filledTrunkVolume: 5000, rangeOnOneTank: 1000, hydraulicLift: false, refrigerator: true))
truckStation.add(TrunkCar(color: .white, yearOfIssue: 1997, trunkValue: 25000, engineIsOn: true, windowsIsOpen: false, filledTrunkVolume: 8900, rangeOnOneTank: 980, hydraulicLift: true, refrigerator: false))
truckStation.add(TrunkCar(color: .gray, yearOfIssue: 2004, trunkValue: 59000, engineIsOn: false, windowsIsOpen: false, filledTrunkVolume: 45000, rangeOnOneTank: 1300, hydraulicLift: true, refrigerator: true))
truckStation.add(TrunkCar(color: .brown, yearOfIssue: 2012, trunkValue: 34000, engineIsOn: false, windowsIsOpen: false, filledTrunkVolume: 3000, rangeOnOneTank: 840, hydraulicLift: false, refrigerator: false))
