import UIKit

//Задание 1
//Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

enum SportCarBrands {
    case lamborgini, ferrari, bugatti, bentley, porshe, koenigsegg
}

enum TrunkCarBrands {
    case kenworth, freightliner, international, caterpillar, mack, autocar
}

enum ChangeEngineStatus {
    case furnOnEngine, turnOffEngine
}

enum ChangeCargoValue {
    case loadCargo, unloadCargo
}

enum ChangeWindowsStatus {
    case openWindows, closeWindows
}

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

var truck1 = TrunkCar(carBrand: .kenworth, yearOfIssue: 1994, trunkValue: 15000, engineIsOn: false, windowsIsOpen: false, filledTrunkVolume: 10000)

var sportcar1 = SportCar(carBrand: .lamborgini, yearOfIssue: 2018, trunkValue: 250, engineIsOn: true, windowsIsOpen: true, filledTrunkVolume: 20)

//Задание 3
//Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

//Задание 4
//Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

//Задание 5
//Инициализировать несколько экземпляров структур. Применить к ним различные действия.

truck1.carActions(action: .openWindows)
truck1.carActions(action: .furnOnEngine)
truck1.changeCargo(mode: .unloadCargo, cargoVolume: 7500)

sportcar1.carActions(action: .closeWindows)
sportcar1.carActions(action: .turnOffEngine)
sportcar1.changeCargo( mode: .loadCargo, cargoVolume: 20)


//Задание 6
//Вывести значения свойств экземпляров в консоль.

print(sportcar1)

print(truck1)
