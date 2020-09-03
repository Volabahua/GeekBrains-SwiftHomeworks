import UIKit

//Задание 1
//Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

enum SportCarBrands {
    case lamborgini, ferrari, bugatti, bentley, porshe, koenigsegg
}

enum TrunkCarBrands {
    case kenworth, freightliner, international, caterpillar, mack, autocar
}

struct SportCar {
    let carBrand: SportCarBrands
    let yearOfIssue: UInt
    let trunkValue: UInt
    var engineIsOn: Bool
    mutating func turnOnEngine() {
        self.engineIsOn = true
    }
    mutating func turnOffEngine() {
        self.engineIsOn = false
    }
    var windowsIsOpen: Bool
    mutating func openWindows() {
        self.windowsIsOpen = true
    }
    mutating func closeWindows() {
        self.windowsIsOpen = false
    }
    var filledTrunkVolume: Int
    mutating func loadCargo(cargoVolume: Int) {
        self.filledTrunkVolume += cargoVolume
    }
    mutating func unloadCargo(cargoVolume: Int) {
        self.filledTrunkVolume -= cargoVolume
    }
}

struct TrunkCar {
    let carBrand: TrunkCarBrands
    let yearOfIssue: UInt
    let trunkValue: UInt
    var engineIsOn: Bool
    mutating func turnOnEngine() {
        self.engineIsOn = true
    }
    mutating func turnOffEngine() {
        self.engineIsOn = false
    }
    var windowsIsOpen: Bool
    mutating func openWindows() {
        self.windowsIsOpen = true
    }
    mutating func closeWindows() {
        self.windowsIsOpen = false
    }
    var filledTrunkVolume: Int
    mutating func loadCargo(cargoVolume: Int) {
        self.filledTrunkVolume += cargoVolume
    }
    mutating func unloadCargo(cargoVolume: Int) {
        self.filledTrunkVolume -= cargoVolume
    }
    
}

//Задание 2
//Описать в каждом наследнике специфичные для него свойства.Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

var truck1 = TrunkCar(carBrand: .kenworth, yearOfIssue: 1994, trunkValue: 15000, engineIsOn: false, windowsIsOpen: false, filledTrunkVolume: 10000)

var sportcar1 = SportCar(carBrand: .lamborgini, yearOfIssue: 2018, trunkValue: 250, engineIsOn: true, windowsIsOpen: true, filledTrunkVolume: 20)

//Задание 3
//Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

truck1.openWindows()
truck1.turnOnEngine()
truck1.unloadCargo(cargoVolume: 7500)

sportcar1.closeWindows()
sportcar1.turnOffEngine()
sportcar1.loadCargo(cargoVolume: 100)


//Задание 4
//Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.



//Задание 5
//Инициализировать несколько экземпляров структур. Применить к ним различные действия.



//Задание 6
//Вывести значения свойств экземпляров в консоль.
