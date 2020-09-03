import UIKit

//Задание 1
//Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

enum SportCarBrands {
    case lamborgini, ferrari, bugatti, bentley, porshe, koenigsegg
}

enum TrunkCarBrands {
    case kenworth, freightliner, international, caterpillar, mack, autocar
}

//Задание 3
//Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
enum ChangeCargoValue {
    case loadCargo, unloadCargo
}

//Задание 4
//Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
enum CarActions{
    case openWindows, closeWindows, furnOnEngine, turnOffEngine
}

struct SportCar {
    let carBrand: SportCarBrands
    let yearOfIssue: UInt
    let trunkValue: UInt
    var engineIsOn: Bool
    var windowsIsOpen: Bool
    var filledTrunkVolume: Int
    
    mutating func changeCargo(mode: ChangeCargoValue, cargoVolume: Int) {
        switch mode  {
        case .loadCargo:
            self.filledTrunkVolume += cargoVolume
        case .unloadCargo:
            self.filledTrunkVolume -= cargoVolume
        }
    }
    
    //К заданию 4
    mutating func carActions(action: CarActions) {
        switch action {
        case .furnOnEngine:
            self.engineIsOn = true
        case .turnOffEngine:
            self.engineIsOn = false
        case .openWindows:
            self.windowsIsOpen = true
        case .closeWindows:
            self.windowsIsOpen = false
        }
    }
}
    
struct TrunkCar {
    let carBrand: TrunkCarBrands
    let yearOfIssue: UInt
    let trunkValue: UInt
    var engineIsOn: Bool
    var windowsIsOpen: Bool
    var filledTrunkVolume: Int
    
    mutating func changeCargo(mode: ChangeCargoValue, cargoVolume: Int) {
        switch mode  {
        case .loadCargo:
            self.filledTrunkVolume += cargoVolume
        case .unloadCargo:
            self.filledTrunkVolume -= cargoVolume
        }
    }
    
    //К заданию 4
    mutating func carActions(action: CarActions) {
        switch action {
        case .furnOnEngine:
            self.engineIsOn = true
        case .turnOffEngine:
            self.engineIsOn = false
        case .openWindows:
            self.windowsIsOpen = true
        case .closeWindows:
            self.windowsIsOpen = false
        }
    }
}

//Задание 2
//Описать в каждом наследнике специфичные для него свойства.Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

//Создадим Спорткар
var sportCar = SportCar(carBrand: .lamborgini, yearOfIssue: 2018, trunkValue: 250, engineIsOn: true, windowsIsOpen: true, filledTrunkVolume: 20)

//Создадим Трак
var truck = TrunkCar(carBrand: .kenworth, yearOfIssue: 1994, trunkValue: 15000, engineIsOn: false, windowsIsOpen: false, filledTrunkVolume: 10000)

//Пропишем в консоль изначальное состояние Спорткара
print(sportCar)

//Пропишем в консоль изначальное состояние Трака
print(truck)

//Задание 5
//Инициализировать несколько экземпляров структур. Применить к ним различные действия.

truck.carActions(action: .openWindows)
truck.carActions(action: .furnOnEngine)
truck.changeCargo(mode: .unloadCargo, cargoVolume: 7500)

sportCar.carActions(action: .closeWindows)
sportCar.carActions(action: .turnOffEngine)
sportCar.changeCargo( mode: .loadCargo, cargoVolume: 120)

//Задание 6
//Вывести значения свойств экземпляров в консоль.

//выведем в консоль состояние Спорткара после изменения
print(sportCar)

//Выведем в консоль состояние Трака после изменения
print(truck)

//Конец домашнего задания
