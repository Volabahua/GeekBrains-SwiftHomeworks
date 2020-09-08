import UIKit

//Задание 1
//Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

enum SportCarBrands {
    case lamborgini, ferrari, bugatti, bentley, porshe, koenigsegg
}

enum TrunkCarBrands {
    case kenworth, freightliner, international, caterpillar, mack, autocar
}

enum ChangeCargoValue {
    case loadCargo, unloadCargo
}

enum CarActions{
    case openWindows, closeWindows, furnOnEngine, turnOffEngine
}

class Car {
    let carBrand: SportCarBrands
    let yearOfIssue: UInt
    let trunkValue: UInt
    var engineIsOn: Bool
    var windowsIsOpen: Bool
    var filledTrunkVolume: Int
    
    init(<#parameters#>) {
        <#statements#>
    }
    
    func changeCargo(mode: ChangeCargoValue, cargoVolume: Int) {
        switch mode  {
        case .loadCargo:
            print("Вы собираетесь положить \(cargoVolume) груза в багажник Спорткара.")
            let guardCargo = self.filledTrunkVolume + cargoVolume
            guard  guardCargo < trunkValue else {
                print("Вы не можете положить этот груз, в багажнике недостаточно места \nОперация не будет выполнена!")
                break
            }
            self.filledTrunkVolume += cargoVolume
            print("После погрузки груза в багажнике стало \(guardCargo) груза")

        case .unloadCargo:
            print("Вы собираетесь выгрузить \(cargoVolume) груза из багажника Спорткара.")
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


//Задание 2
//Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.



//Задание 3
//Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.



//Задание 4
//В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.



//Задание 5
//Создать несколько объектов каждого класса. Применить к ним различные действия.



//Задание 6
//Вывести значения свойств экземпляров в консоль.


