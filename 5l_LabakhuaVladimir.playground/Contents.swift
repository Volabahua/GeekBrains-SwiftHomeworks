import UIKit

//Задание 1
//Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.

protocol Car {
    var color: UIColor { get set }
    var yearOfIssue: UInt { get set }
    var trunkValue: UInt { get set }
    var engineIsOn: Bool { get set }
    var windowsIsOpen: Bool { get set }
    var filledTrunkVolume: Int { get set }
}


//Задание 2
//Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

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

//Задание 3
//Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

class SportCar: Car {
    var color: UIColor
    var yearOfIssue: UInt
    var trunkValue: UInt
    var engineIsOn: Bool
    var windowsIsOpen: Bool
    var filledTrunkVolume: Int
    
    //Отличающиеся свойства
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

class TrunkCar: Car {
    var color: UIColor
    var yearOfIssue: UInt
    var trunkValue: UInt
    var engineIsOn: Bool
    var windowsIsOpen: Bool
    var filledTrunkVolume: Int
    
    //Отличающиеся свойства
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

//Задание 4
//Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Спортивный автомобиль \(yearOfIssue) года выпуска \nМаксимальная скорость - \(maxSpeed) \nМаксимальной вместительностью \(trunkValue) груза \nДвигатель запущен - \(engineIsOn) \nОкна открыты - \(windowsIsOpen)\nИмеет спойлер - \(spoiler) \nИмеет турбо - \(turbo) "
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Грузовой автомобиль \(yearOfIssue) года выпуска \nДальность поездки на одном баке - \(rangeOnOneTank) \nМаксимальной вместительностью \(trunkValue) груза \nДвигатель запущен - \(engineIsOn) \nОкна открыты - \(windowsIsOpen) \nИмеет гидравлический лифт - \(hydraulicLift) \nИмеет холодильную установку - \(refrigerator)"
    }
}

//Задание 5
//Создать несколько объектов каждого класса. Применить к ним различные действия.

var honda = SportCar(color: .red, yearOfIssue: 2020, trunkValue: 300, engineIsOn: false, windowsIsOpen: true, filledTrunkVolume: 15, maxSpeed: 240, spoiler: true, turbo: false)

var man = TrunkCar(color: .blue, yearOfIssue: 1995, trunkValue: 50000, engineIsOn: true, windowsIsOpen: false, filledTrunkVolume: 10000, rangeOnOneTank: 900, hydraulicLift: true, refrigerator: false)

honda.loadCargo(cargoVolume: 30)
honda.closeWindow()
honda.startEngine()

man.unloadCargo(cargoVolume: 3500)
man.openWindow()
man.stopEngine()

//Задание 6
//Вывести сами объекты в консоль.

print(honda)
print(man)
