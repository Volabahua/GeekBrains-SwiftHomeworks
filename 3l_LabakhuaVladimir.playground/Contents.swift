import UIKit

//Задание 1
//Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

enum SportCarBrands: String {
    case lamborgini = "Lamborgini"
    case ferrari = "Ferrari"
    case bugatti = "Vugatti"
    case bentley = "Bentley"
    case porshe = "Porshe"
    case koenigsegg = "Koenigsegg"
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
            let guardCargo = self.filledTrunkVolume + cargoVolume
            guard  guardCargo < trunkValue else {
                print("Вы не можете положить этот груз, в багажнике недостаточно места \nОперация не будет выполнена!")
                break
            }
            self.filledTrunkVolume += cargoVolume
            print("После погрузки груза в багажнике стало \(guardCargo) груза")

        case .unloadCargo:
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
    mutating func carActions(action: CarActions) {
        switch action {
        case .furnOnEngine:
            self.engineIsOn = true
            print("Двигатель Спорткара запущен")
        case .turnOffEngine:
            self.engineIsOn = false
            print("Двигатель Спорткара выключен")
        case .openWindows:
            self.windowsIsOpen = true
            print("Окна Спорткара открыты")
        case .closeWindows:
            self.windowsIsOpen = false
            print("Окна Спорткара закрыты")
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
            let guardCargo = self.filledTrunkVolume + cargoVolume
            guard  guardCargo < trunkValue else {
                print("Вы не можете положить этот груз, в кузове недостаточно места \nОперация не будет выполнена!")
                break
            }
            self.filledTrunkVolume += cargoVolume
            print("После погрузки груза в кузове стало \(guardCargo) груза")
        case .unloadCargo:
            let guardCargo = self.filledTrunkVolume - cargoVolume
            guard  guardCargo > 0 else {
                print("Вы не можете выгрузить этот груз, в кузове его недостаточно \nОперация не будет выполнена!")
                break
            }
            self.filledTrunkVolume -= cargoVolume
            print("После выгрузки груза в кузове осталось \(guardCargo) груза")
        }
    }
    
    //К заданию 4
    mutating func carActions(action: CarActions) {
        switch action {
        case .furnOnEngine:
            self.engineIsOn = true
            print("Двигатель Трака запущен")
        case .turnOffEngine:
            self.engineIsOn = false
            print("Двигатель Трака выключен")
        case .openWindows:
            self.windowsIsOpen = true
            print("Окна Трака открыты")
        case .closeWindows:
            self.windowsIsOpen = false
            print("Окна Трака закрыты")
        }
    }
}

//Задание 2
//Описать в каждом наследнике специфичные для него свойства.Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

//Создадим Спорткар
var sportCar = SportCar(carBrand: , yearOfIssue: 2018, trunkValue: 250, engineIsOn: true, windowsIsOpen: true, filledTrunkVolume: 20)

//Создадим Трак
var truck = TrunkCar(carBrand: .kenworth, yearOfIssue: 1994, trunkValue: 15000, engineIsOn: false, windowsIsOpen: false, filledTrunkVolume: 10000)

//Пропишем в консоль изначальное состояние Спорткара
print(sportCar)

//Пропишем в консоль изначальное состояние Трака
print(truck)

//Задание 5
//Инициализировать несколько экземпляров структур. Применить к ним различные действия.

truck.carActions(action: .closeWindows)
truck.carActions(action: .furnOnEngine)
truck.changeCargo(mode: .unloadCargo, cargoVolume: 7500)

sportCar.carActions(action: .closeWindows)
sportCar.carActions(action: .turnOffEngine)
sportCar.changeCargo( mode: .loadCargo, cargoVolume: 2220)

//Задание 6
//Вывести значения свойств экземпляров в консоль.

//выведем в консоль состояние Спорткара после изменения
print(sportCar)

//Выведем в консоль состояние Трака после изменения
print(truck)

//Конец домашнего задания
