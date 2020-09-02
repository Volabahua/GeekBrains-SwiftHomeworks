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
    let engineIsOn: Bool
    let windowsIsOpen: Bool
    let filledTrunkVolume: UInt
}

struct TrunkCar {
    let carBrand: TrunkCarBrands
    let yearOfIssue: UInt
    let engineIsOn: Bool
    let windowsIsOpen: Bool
    let filledTrunkVolume: UInt
}

//Задание 2
//Описать в каждом наследнике специфичные для него свойства.Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.



//Задание 3
//Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.



//Задание 4
//Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.



//Задание 5
//Инициализировать несколько экземпляров структур. Применить к ним различные действия.



//Задание 6
//Вывести значения свойств экземпляров в консоль.
