import UIKit

//Задание 1
//Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

enum SportCarBrands: String {
    case lamborgini = "Lamborgini"
    case ferrari = "Ferrari"
    case bugatti = "Bugatti"
    case bentley = "Bentley"
    case porshe = "Porshe"
    case koenigsegg = "Koenigsegg"
}

enum TrunkCarBrands: String {
    case kenworth = "Kenworth"
    case freightliner = "Freightliner"
    case international = "International"
    case caterpillar = "Caterpillar"
    case mack = "Mack"
    case autocar = "Autocar"
}


class Car {
    var yearOfIssue: UInt
    var trunkValue: UInt
    var engineIsOn: Bool
    var windowsIsOpen: Bool
    var filledTrunkVolume: Int
    
    init(yearOfIssue: UInt, trunkValue: UInt, engineIsOn: Bool, windowsIsOpen: Bool, filledTrunkVolume: Int) {
        self.yearOfIssue = yearOfIssue
        self.trunkValue = trunkValue
        self.engineIsOn = engineIsOn
        self.windowsIsOpen = windowsIsOpen
        self.filledTrunkVolume = filledTrunkVolume
    }
    
    func changeCargo(mode: ChangeCargoValue, cargoVolume: Int) {
        switch mode  {
        case .loadCargo:
            print("Вы собираетесь положить \(cargoVolume) груза в багажник.")
            let guardCargo = self.filledTrunkVolume + cargoVolume
            guard  guardCargo < trunkValue else {
                print("Вы не можете положить этот груз, в багажнике недостаточно места \nОперация не будет выполнена!")
                break
            }
            self.filledTrunkVolume += cargoVolume
            print("После погрузки груза в багажнике стало \(guardCargo) груза")

        case .unloadCargo:
            print("Вы собираетесь выгрузить \(cargoVolume) груза из багажника.")
            let guardCargo = self.filledTrunkVolume - cargoVolume
            guard  guardCargo > 0 else {
                print("Вы не можете выгрузить этот груз, в багажнике его недостаточно \nОперация не будет выполнена!")
                break
            }
            self.filledTrunkVolume -= cargoVolume
            print("После выгрузки груза в багажнике осталось \(guardCargo) груза")
        }
    }
    
    //К заданию 4
    func carActions(action: CarActions) {
        switch action {
        case .furnOnEngine:
            self.engineIsOn = true
            print("Двигатель запущен")
        case .turnOffEngine:
            self.engineIsOn = false
            print("Двигатель выключен")
        case .openWindows:
            self.windowsIsOpen = true
            print("Окна открыты")
        case .closeWindows:
            self.windowsIsOpen = false
            print("Окна закрыты")
        case .turnOnTurbo:
            print("Опция доступна для спорткаров")
        case .turnOffTurbo:
            print("Опция доступна для спорткаров")
        case .turnOnRefrigerator:
            print("Опция доступна для траков")
        case .turnOffRefrigerator:
            print("Опция доступна для траков")
        }
    }
}

//Задание 2
//Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.

class SportCar: Car {
    var carBrand: SportCarBrands
    var turboIsOn: Bool
    
    init(carBrand: SportCarBrands, turboIsOn: Bool, yearOfIssue: UInt, trunkValue: UInt, engineIsOn: Bool, windowsIsOpen: Bool, filledTrunkVolume: Int) {
        self.carBrand = carBrand
        self.turboIsOn = turboIsOn
        super.init(yearOfIssue: yearOfIssue, trunkValue: trunkValue, engineIsOn: engineIsOn, windowsIsOpen: windowsIsOpen, filledTrunkVolume: filledTrunkVolume)
    }
    
    //К заданию 4
    override func carActions(action: CarActions) {
        switch action {
        case .furnOnEngine:
            self.engineIsOn = true
            print("Двигатель запущен")
        case .turnOffEngine:
            self.engineIsOn = false
            print("Двигатель выключен")
        case .openWindows:
            self.windowsIsOpen = true
            print("Окна открыты")
        case .closeWindows:
            self.windowsIsOpen = false
            print("Окна закрыты")
        case .turnOnTurbo:
            self.turboIsOn = true
            print("Турбоподдув включен")
        case .turnOffTurbo:
            self.turboIsOn = false
            print("Турбоподдув включен")
        case .turnOnRefrigerator:
            print("Опция доступна только для траков")
        case .turnOffRefrigerator:
            print("Опция доступна только для траков")
        }
    }
    
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "\nСпортивный автомобиль \(carBrand.rawValue), \(yearOfIssue) года выпуска\nЗагруженность - \(filledTrunkVolume)/\(trunkValue) \nТурбоподдув включен - \(turboIsOn)\nДвигатель запущен - \(engineIsOn)\nОкна открыты - \(windowsIsOpen)\n "
    }
}

class TrunkCar: Car {
    var carBrand: TrunkCarBrands
    var refrigeratorIsOn: Bool
    
    init(carBrand: TrunkCarBrands, refrigeratorIsOn: Bool, yearOfIssue: UInt, trunkValue: UInt, engineIsOn: Bool, windowsIsOpen: Bool, filledTrunkVolume: Int) {
        self.carBrand = carBrand
        self.refrigeratorIsOn = refrigeratorIsOn
        super.init(yearOfIssue: yearOfIssue, trunkValue: trunkValue, engineIsOn: engineIsOn, windowsIsOpen: windowsIsOpen, filledTrunkVolume: filledTrunkVolume)
    }
    
    //К заданию 4
    override func carActions(action: CarActions) {
        switch action {
        case .furnOnEngine:
            self.engineIsOn = true
            print("Двигатель запущен")
        case .turnOffEngine:
            self.engineIsOn = false
            print("Двигатель выключен")
        case .openWindows:
            self.windowsIsOpen = true
            print("Окна открыты")
        case .closeWindows:
            self.windowsIsOpen = false
            print("Окна закрыты")
        case .turnOnTurbo:
            print("Опция доступна для спорткаров")
        case .turnOffTurbo:
            print("Опция доступна для спорткаров")
        case .turnOnRefrigerator:
            self.refrigeratorIsOn = true
            print("Холодильная установка включена")
        case .turnOffRefrigerator:
            self.refrigeratorIsOn = false
            print("Холодильная установка выключена")
        }
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "\nГрузовой автомобиль \(carBrand.rawValue), \(yearOfIssue) года выпуска\nМаксимальной вместительностью \(trunkValue) груза\nЗагружен на \(filledTrunkVolume)/\(trunkValue) \nДвигатель запущен - \(engineIsOn) \nОкна открыты - \(windowsIsOpen)\nРефрежератор работает - \(refrigeratorIsOn)\n "
    }
}

//Задание 3
//Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

enum ChangeCargoValue {
    case loadCargo, unloadCargo
}

enum CarActions {
    case openWindows, closeWindows, furnOnEngine, turnOffEngine, turnOnTurbo, turnOffTurbo, turnOnRefrigerator, turnOffRefrigerator
}

//Задание 4
//В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

//Задание 5
//Создать несколько объектов каждого класса. Применить к ним различные действия.

var sportCar = SportCar(carBrand: .bentley, turboIsOn: false, yearOfIssue: 2020, trunkValue: 200, engineIsOn: true, windowsIsOpen: true, filledTrunkVolume: 25)
var trunkCar = TrunkCar(carBrand: .international, refrigeratorIsOn: true, yearOfIssue: 1999, trunkValue: 25000, engineIsOn: false, windowsIsOpen: false, filledTrunkVolume: 5900)

print(sportCar)
sportCar.carActions(action: .turnOnTurbo)
sportCar.carActions(action: .closeWindows)
sportCar.carActions(action: .turnOffRefrigerator)
sportCar.changeCargo(mode: .loadCargo, cargoVolume: 50)

print(trunkCar)
trunkCar.carActions(action: .turnOffRefrigerator)
trunkCar.carActions(action: .furnOnEngine)
trunkCar.carActions(action: .turnOnTurbo)
trunkCar.changeCargo(mode: .unloadCargo, cargoVolume: 2500)


//Задание 6
//Вывести значения свойств экземпляров в консоль.

print(sportCar)
print(trunkCar)
