import UIKit

//Задание 1
//Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.

//Задание 2
//Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

//Выбор размеров приготавливаемого кофе
enum CoffeSize: String {
    case small = "Маленький"
    case medium = "Средний"
    case big = "Большой"
}

//Перечисление возможных ошибок
enum CoffeMachineErrors: Error {
    case notEnoughSugar
    case notEnoughCoffe
    case notEnoughMilk
    case invalidSize
    case notEnoughStorageSpace
}

//Протокол хранения ингридиентов в хранилище
protocol Storage {
    var sugar: Int {get set}
    var coffe: Int {get set}
    var milk: Int {get set}
    
    var sugarStorage: Int {get set}
    var coffeStorage: Int {get set}
    var milkStorage: Int {get set}
}

//Пополнить кофе в хранилище
extension Storage {
    mutating func refillCoffe(_ refill: Int) throws {
        guard ({self.coffe + refill})() < coffeStorage else {
            throw CoffeMachineErrors.notEnoughStorageSpace
        }
        print("Хранилище Кофе пополнено на: \(refill)")
        return self.coffe += refill
    }
}

//Пополнить молоко в хранилище
extension Storage {
    mutating func refillMilk(_ refill: Int) throws {
        guard ({self.milk + refill})() < milkStorage else {
             throw CoffeMachineErrors.notEnoughStorageSpace
         }
        print("Хранилище Молока пополнено на: \(refill)")
        return self.milk += refill
    }
}

//Пополнить сахар в хранилище
extension Storage {
    mutating func refillSugar(_ refill: Int) throws {
        guard ({self.sugar + refill})() < sugarStorage else {
             throw CoffeMachineErrors.notEnoughStorageSpace
         }
        print("Хранилище Сахара пополнено на: \(refill)")
        return self.sugar += refill
    }
}

//Используемые ингридиенты для приготовления кофе
protocol MakingCoffe: Storage {
    var latteSmallRequiredCoffe: Int {get}//Маленький латте
    var latteSmallRequiredMilk: Int {get}//Маленький латте
    var latteSmallRequiredSugar: Int {get}//Маленький латте
    var latteMediumRequiredCoffe: Int {get}//Средний латте
    var latteMediumRequiredMilk: Int {get}//Средний латте
    var latteMediumRequiredSugar: Int {get}//Средний латте
    var latteBigRequiredCoffe: Int {get}//Большой латте
    var latteBigRequiredMilk: Int {get}//Большой латте
    var latteBigRequiredSugar: Int {get}//Большой латте
    
    var americanoMediumRequiredCoffe: Int {get}//Средний американо
    var americanoMediumRequiredSugar: Int {get}//Средний американо
    var americanoBigRequiredCoffe: Int {get}//Большой американо
    var americanoBigRequiredSugar: Int {get}//Большой американо
    
    var cappuchinoMediumRequiredCoffe: Int {get}//Средний каппучино
    var cappuchinoMediumRequiredMilk: Int {get}//Средний каппучино
    var cappuchinoMediumRequiredSugar: Int {get}//Средний каппучино
    var cappuchinoBigRequiredCoffe: Int {get}//Большой каппучино
    var cappuchinoBigRequiredMilk: Int {get}//Большой каппучино
    var cappuchinoBigRequiredSugar: Int {get}//Большой каппучино
    
    var espressoRequiredCoffe: Int {get}//Еспрессо
    var espressoRequiredSugar: Int {get}//Еспрессо
}

//Рецепты для приготовления кофе
extension MakingCoffe {
    var latteSmallRequiredCoffe: Int {2}//Маленький латте
    var latteSmallRequiredMilk: Int {2}//Маленький латте
    var latteSmallRequiredSugar: Int {2}//Маленький латте
    var latteMediumRequiredCoffe: Int {3}//Средний латте
    var latteMediumRequiredMilk: Int {3}//Средний латте
    var latteMediumRequiredSugar: Int {3}//Средний латте
    var latteBigRequiredCoffe: Int {5}//Большой латте
    var latteBigRequiredMilk: Int {5}//Большой латте
    var latteBigRequiredSugar: Int {5}//Большой латте
    
    var americanoMediumRequiredCoffe: Int {4}//Средний американо
    var americanoMediumRequiredSugar: Int {3}//Средний американо
    var americanoBigRequiredCoffe: Int {5}//Большой американо
    var americanoBigRequiredSugar: Int {4}//Большой американо
    
    var cappuchinoMediumRequiredCoffe: Int {3}//Средний каппучино
    var cappuchinoMediumRequiredMilk: Int {5}//Средний каппучино
    var cappuchinoMediumRequiredSugar: Int {3}//Средний каппучино
    var cappuchinoBigRequiredCoffe: Int {4}//Большой каппучино
    var cappuchinoBigRequiredMilk: Int {7}//Большой каппучино
    var cappuchinoBigRequiredSugar: Int {4}//Большой каппучино
    
    var espressoRequiredCoffe: Int {4}//Еспрессо
    var espressoRequiredSugar: Int {2}//Еспрессо
}

//Приготовление Латте
extension MakingCoffe {
    mutating func makeLatte(size: CoffeSize, withSugar:Bool) -> (Void? , CoffeMachineErrors?) {
        
        if withSugar == true {
            print("Вы выбрали \(size.rawValue) Кофе Латте с сахаром ")
        } else {
            print("Вы выбрали \(size.rawValue) Кофе Латте без сахара")
        }
        
        switch size {
        case .small:
            guard self.coffe >= latteSmallRequiredCoffe else {return (print("В аппарате закончилось кофе"), .notEnoughCoffe)}
            guard self.milk >= latteSmallRequiredMilk else {return (print("В аппарате закончилось молоко"), .notEnoughMilk)}
            if withSugar == true {
                guard self.sugar >= latteSmallRequiredSugar else {return (print("В аппарате закончился сахар"), .notEnoughSugar)}
                self.sugar -= latteSmallRequiredSugar
            }
            self.coffe -= latteSmallRequiredCoffe
            self.milk -= latteSmallRequiredMilk
            return (print("Вы купили \(size.rawValue) Кофе Латте "), nil )
            
        case .medium:
            guard self.coffe >= latteMediumRequiredCoffe else {return (print("В аппарате закончилось кофе"), .notEnoughCoffe)}
            guard self.milk >= latteMediumRequiredMilk else {return (print("В аппарате закончилось молоко"), .notEnoughMilk)}
            if withSugar == true {
                guard self.sugar >= latteMediumRequiredSugar else {return (print("В аппарате закончился сахар"), .notEnoughSugar)}
                self.sugar -= latteMediumRequiredSugar
            }
            self.coffe -= latteMediumRequiredCoffe
            self.milk -= latteMediumRequiredMilk
            return (print("Вы купили \(size.rawValue) Кофе Латте "), nil )
            
        case .big:
            guard self.coffe >= latteBigRequiredCoffe else {return (print("В аппарате закончилось кофе"), .notEnoughCoffe)}
            guard self.milk >= latteBigRequiredMilk else {return (print("В аппарате закончилось молоко"), .notEnoughMilk)}
            if withSugar == true {
                guard self.sugar >= latteBigRequiredSugar else {return (print("В аппарате закончился сахар"), .notEnoughSugar)}
                self.sugar -= latteBigRequiredSugar
            }
            self.coffe -= latteBigRequiredCoffe
            self.milk -= latteBigRequiredMilk
            return (print("Вы купили \(size.rawValue) Кофе Латте "), nil )
        }
    }
}

//Приготовление Американо
extension MakingCoffe {
    mutating func makeAmericano(size: CoffeSize, withSugar:Bool) -> (Void? , CoffeMachineErrors?) {
        
        if withSugar == true {
            print("Вы выбрали \(size.rawValue) Кофе Американо с сахаром ")
        } else {
            print("Вы выбрали \(size.rawValue) Кофе Американо без сахара")
        }
        
        switch size {
            
        case .small:
            return (print("Невозможно приготовить \(size.rawValue) Американо"), .invalidSize)
            
        case .medium:
            guard self.coffe >= americanoMediumRequiredCoffe else {return (print("В аппарате закончилось кофе"), .notEnoughCoffe)}
            if withSugar == true {
                guard self.sugar >= americanoMediumRequiredSugar else {return (print("В аппарате закончился сахар"), .notEnoughSugar)}
                self.sugar -= americanoMediumRequiredSugar
            }
            self.coffe -= americanoMediumRequiredCoffe
            return (print("Вы купили \(size.rawValue) Кофе Американо "), nil )
            
        case .big:
            guard self.coffe >= americanoBigRequiredCoffe else {return (print("В аппарате закончилось кофе"), .notEnoughCoffe)}
            if withSugar == true {
                guard self.sugar >= americanoBigRequiredSugar else {return (print("В аппарате закончился сахар"), .notEnoughSugar)}
                self.sugar -= americanoBigRequiredSugar
            }
            self.coffe -= americanoBigRequiredCoffe
            return (print("Вы купили \(size.rawValue) Кофе Американо "), nil )
        }
    }
}

//Приготовление Каппучино
extension MakingCoffe {
    mutating func makeCappuchino(size: CoffeSize, withSugar:Bool) -> (Void? , CoffeMachineErrors?) {
        if withSugar == true {
            print("Вы выбрали \(size.rawValue) Кофе Каппучино с сахаром ")
        } else {
            print("Вы выбрали \(size.rawValue) Кофе Каппучино без сахара")
        }
        
        switch size {
            
        case .small:
            return (print("Невозможно приготовить \(size.rawValue) Каппучино"), .invalidSize)
            
        case .medium:
            guard self.coffe >= cappuchinoMediumRequiredCoffe else {return (print("В аппарате закончилось кофе"), .notEnoughCoffe)}
            guard self.milk >= cappuchinoBigRequiredMilk else {return (print("В аппарате закончилось молоко"), .notEnoughMilk)}
            if withSugar == true {
                guard self.sugar >= cappuchinoMediumRequiredSugar else {return (print("В аппарате закончился сахар"), .notEnoughSugar)}
                self.sugar -= cappuchinoMediumRequiredSugar
            }
            self.coffe -= cappuchinoMediumRequiredCoffe
            self.milk -= cappuchinoBigRequiredMilk
            return (print("Вы купили \(size.rawValue) Кофе Каппучино "), nil )
            
        case .big:
            guard self.coffe >= cappuchinoBigRequiredCoffe else {return (print("В аппарате закончилось кофе"), .notEnoughCoffe)}
            guard self.milk >= cappuchinoBigRequiredMilk else {return (print("В аппарате закончилось молоко"), .notEnoughMilk)}
            if withSugar == true {
                guard self.sugar >= cappuchinoBigRequiredSugar else {return (print("В аппарате закончился сахар"), .notEnoughSugar)}
                self.sugar -= cappuchinoBigRequiredSugar
            }
            self.coffe -= cappuchinoBigRequiredCoffe
            self.milk -= cappuchinoBigRequiredMilk
            return (print("Вы купили \(size.rawValue) Кофе Каппучино "), nil )
        }
    }
}

//Приготовление Эспрессо
extension MakingCoffe {
    mutating func makeEspresso(withSugar:Bool) -> (Void?, CoffeMachineErrors?) {
        if withSugar == true {
            print("Вы выбрали Кофе Еспрессо с сахаром ")
        } else {
            print("Вы выбрали Кофе Еспрессо без сахара")
        }
        
        guard self.coffe >= espressoRequiredCoffe else {return (print("В аппарате закончилось кофе"), .notEnoughCoffe)}
        if withSugar == true {
            guard self.sugar >= espressoRequiredSugar else {return (print("В аппарате закончился сахар"), .notEnoughSugar)}
            self.sugar -= espressoRequiredSugar
        }
        self.coffe -= espressoRequiredCoffe
        return (print("Вы купили Кофе Еспрессо "), nil )
    }
}

//Кофемашина для приготовления кофе
class CoffeMachine: MakingCoffe, Storage {
    var coffe: Int
    var milk: Int
    var sugar: Int
    

    var coffeStorage: Int
    var milkStorage: Int
    var sugarStorage: Int
    
    
    init(sugarStorage: Int, coffeStorage: Int, milkStorage:Int) {
        self.coffeStorage = coffeStorage
        self.milkStorage = milkStorage
        self.sugarStorage = sugarStorage
        self.coffe = 0
        self.milk = 0
        self.sugar = 0
    }
}

//Вывод состояния хранилища кофемашины
extension CoffeMachine: CustomStringConvertible {
    var description: String {
        return "\nНа данный момент в кофемашине\nКофе: \(coffe)/\(coffeStorage)\nМолока: \(milk)/\(milkStorage)\nСахара: \(sugar)/\(sugarStorage)\n"
    }
}

//Создадим экземпляр кофе машины с хранилищем определенной вместимости
var Vender = CoffeMachine(sugarStorage: 50, coffeStorage: 50, milkStorage: 50)

//Заполним хранилище кофемешины
do {
    try Vender.refillCoffe(30)
} catch CoffeMachineErrors.notEnoughStorageSpace {
    print("Невозможно пополнить хранилище. Недостаточно свободного места.")
}

do {
    try Vender.refillMilk(30)
} catch CoffeMachineErrors.notEnoughStorageSpace {
    print("Невозможно пополнить хранилище. Недостаточно свободного места.")
}

do {
    try Vender.refillSugar(30)
} catch CoffeMachineErrors.notEnoughStorageSpace {
    print("Невозможно пополнить хранилище. Недостаточно свободного места.")
}

//Приготовим несколько чашек кофе периодически наблюдая за изменениями в хранилище
print(Vender)
Vender.makeLatte(size: .small,withSugar: false)
print(Vender)
Vender.makeEspresso(withSugar: false)
print(Vender)
Vender.makeCappuchino(size: .big, withSugar: true)
print(Vender)
Vender.makeLatte(size: .medium, withSugar: false)
print(Vender)
Vender.makeAmericano(size: .small, withSugar: false)
Vender.makeAmericano(size: .medium, withSugar: true)
print(Vender)

//Заполним хранилище еще раз и поймаем ошибку
do {
    try Vender.refillCoffe(30)
} catch CoffeMachineErrors.notEnoughStorageSpace {
    print("Невозможно пополнить хранилище. Недостаточно свободного места.")
}

do {
    try Vender.refillMilk(30)
} catch CoffeMachineErrors.notEnoughStorageSpace {
    print("Невозможно пополнить хранилище. Недостаточно свободного места.")
}

do {
    try Vender.refillSugar(30)
} catch CoffeMachineErrors.notEnoughStorageSpace {
    print("Невозможно пополнить хранилище. Недостаточно свободного места.")
}

//Контрольная проверка состояния хранилища кофемашины
print(Vender)
