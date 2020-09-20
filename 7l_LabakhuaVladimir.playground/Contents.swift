import UIKit

//Задание 1
//Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.

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
}

//Протокол хранения ингридиентов в хранилище
protocol Storage {
    var sugar: Int {get set}
    var coffe: Int {get set}
    var milk: Int {get set}
}

//Пополнить кофе в хранилище
extension Storage {
    mutating func refillCoffe(_ refill: Int) {
        print("Хранилище Кофе пополнено на: \(refill)")
        return self.coffe += refill
    }
}

//Пополнить молоко в хранилище
extension Storage {
    mutating func refillMilk(_ refill: Int) {
        print("Хранилище Молока пополнено на: \(refill)")
        return self.milk += refill
    }
}

//Пополнить сахар в хранилище
extension Storage {
    mutating func refillSugar(_ refill: Int) {
        print("Хранилище Сахара пополнено на: \(refill)")
        return self.sugar += refill
    }
}

//Используемые ингридиенты для приготовления кофе
protocol MakingCoffe: Storage {
    var latteSmallRequiredCoffe: Int {get}
    var latteSmallRequiredMilk: Int {get}
    var latteSmallRequiredSugar: Int {get}
    var latteMediumRequiredCoffe: Int {get}
    var latteMediumRequiredMilk: Int {get}
    var latteMediumRequiredSugar: Int {get}
    var latteBigRequiredCoffe: Int {get}
    var latteBigRequiredMilk: Int {get}
    var latteBigRequiredSugar: Int {get}
    
    var americanoMediumRequiredCoffe: Int {get}
    var americanoMediumRequiredSugar: Int {get}
    var americanoBigRequiredCoffe: Int {get}
    var americanoBigRequiredSugar: Int {get}
    
    var cappuchinoMediumRequiredCoffe: Int {get}
    var cappuchinoMediumRequiredMilk: Int {get}
    var cappuchinoMediumRequiredSugar: Int {get}
    var cappuchinoBigRequiredCoffe: Int {get}
    var cappuchinoBigRequiredMilk: Int {get}
    var cappuchinoBigRequiredSugar: Int {get}
    
    var espressoRequiredCoffe: Int {get}
    var espressoRequiredSugar: Int {get}
}

//Рецепты для приготовления кофе
extension MakingCoffe {
    var latteSmallRequiredCoffe: Int {2}
    var latteSmallRequiredMilk: Int {2}
    var latteSmallRequiredSugar: Int {2}
    var latteMediumRequiredCoffe: Int {3}
    var latteMediumRequiredMilk: Int {3}
    var latteMediumRequiredSugar: Int {3}
    var latteBigRequiredCoffe: Int {5}
    var latteBigRequiredMilk: Int {5}
    var latteBigRequiredSugar: Int {5}
    
    var americanoMediumRequiredCoffe: Int {4}
    var americanoMediumRequiredSugar: Int {3}
    var americanoBigRequiredCoffe: Int {5}
    var americanoBigRequiredSugar: Int {4}
    
    var cappuchinoMediumRequiredCoffe: Int {3}
    var cappuchinoMediumRequiredMilk: Int {5}
    var cappuchinoMediumRequiredSugar: Int {3}
    var cappuchinoBigRequiredCoffe: Int {4}
    var cappuchinoBigRequiredMilk: Int {7}
    var cappuchinoBigRequiredSugar: Int {4}
    
    var espressoRequiredCoffe: Int {4}
    var espressoRequiredSugar: Int {2}
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
            self.coffe -= latteSmallRequiredCoffe
            guard self.milk >= latteSmallRequiredMilk else {return (print("В аппарате закончилось молоко"), .notEnoughMilk)}
            self.milk -= latteSmallRequiredMilk
            if withSugar == true {
                guard self.sugar >= latteSmallRequiredSugar else {return (print("В аппарате закончился сахар"), .notEnoughSugar)}
                self.sugar -= latteSmallRequiredSugar
            }
            return (print("Вы купили \(size.rawValue) Кофе Латте "), nil )
            
        case .medium:
            guard self.coffe >= latteMediumRequiredCoffe else {return (print("В аппарате закончилось кофе"), .notEnoughCoffe)}
            self.coffe -= latteMediumRequiredCoffe
            guard self.milk >= latteMediumRequiredMilk else {return (print("В аппарате закончилось молоко"), .notEnoughMilk)}
            self.milk -= latteMediumRequiredMilk
            if withSugar == true {
                guard self.sugar >= latteMediumRequiredSugar else {return (print("В аппарате закончился сахар"), .notEnoughSugar)}
                self.sugar -= latteMediumRequiredSugar
            }
            return (print("Вы купили \(size.rawValue) Кофе Латте "), nil )
            
        case .big:
            guard self.coffe >= latteBigRequiredCoffe else {return (print("В аппарате закончилось кофе"), .notEnoughCoffe)}
            self.coffe -= latteBigRequiredCoffe
            guard self.milk >= latteBigRequiredMilk else {return (print("В аппарате закончилось молоко"), .notEnoughMilk)}
            self.milk -= latteBigRequiredMilk
            if withSugar == true {
                guard self.sugar >= latteBigRequiredSugar else {return (print("В аппарате закончился сахар"), .notEnoughSugar)}
                self.sugar -= latteBigRequiredSugar
            }
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
            self.coffe -= americanoMediumRequiredCoffe
            if withSugar == true {
                guard self.sugar >= americanoMediumRequiredSugar else {return (print("В аппарате закончился сахар"), .notEnoughSugar)}
                self.sugar -= americanoMediumRequiredSugar
            }
            return (print("Вы купили \(size.rawValue) Кофе Латте "), nil )
            
        case .big:
            guard self.coffe >= americanoBigRequiredCoffe else {return (print("В аппарате закончилось кофе"), .notEnoughCoffe)}
            self.coffe -= americanoBigRequiredCoffe
            if withSugar == true {
                guard self.sugar >= americanoBigRequiredSugar else {return (print("В аппарате закончился сахар"), .notEnoughSugar)}
                self.sugar -= americanoBigRequiredSugar
            }
            return (print("Вы купили \(size.rawValue) Кофе Латте "), nil )
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
            self.coffe -= cappuchinoMediumRequiredCoffe
            guard self.milk >= cappuchinoBigRequiredMilk else {return (print("В аппарате закончилось молоко"), .notEnoughMilk)}
            self.milk -= cappuchinoBigRequiredMilk
            if withSugar == true {
                guard self.sugar >= cappuchinoMediumRequiredSugar else {return (print("В аппарате закончился сахар"), .notEnoughSugar)}
                self.sugar -= cappuchinoMediumRequiredSugar
            }
            return (print("Вы купили \(size.rawValue) Кофе Каппучино "), nil )
            
        case .big:
            guard self.coffe >= cappuchinoBigRequiredCoffe else {return (print("В аппарате закончилось кофе"), .notEnoughCoffe)}
            self.coffe -= cappuchinoBigRequiredCoffe
            guard self.milk >= cappuchinoBigRequiredMilk else {return (print("В аппарате закончилось молоко"), .notEnoughMilk)}
            self.milk -= cappuchinoBigRequiredMilk
            if withSugar == true {
                guard self.sugar >= cappuchinoBigRequiredSugar else {return (print("В аппарате закончился сахар"), .notEnoughSugar)}
                self.sugar -= cappuchinoBigRequiredSugar
            }
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
        self.coffe -= espressoRequiredCoffe
        if withSugar == true {
            guard self.sugar >= espressoRequiredSugar else {return (print("В аппарате закончился сахар"), .notEnoughSugar)}
            self.sugar -= espressoRequiredSugar
        }
        return (print("Вы купили Кофе Еспрессо "), nil )
    }
}

//Кофемашина для приготовления кофе
class CoffeMachine: MakingCoffe, Storage {
    var sugar: Int
    var coffe: Int
    var milk: Int
    
    init(sugar: Int, coffe: Int, milk:Int) {
        self.coffe = coffe
        self.milk = milk
        self.sugar = sugar
    }
}

//Вывод состояния хранилища кофемашины
extension CoffeMachine: CustomStringConvertible {
    var description: String {
        return "\nНа данный момент в кофемашине\nКофе: \(coffe)\nМолока: \(milk)\nСахара: \(sugar)\n"
    }
}

//Создадим экземпляр кофе машины и заполним его ингридиентами каждого типа
var Vender = CoffeMachine(sugar: 10, coffe: 10, milk: 10)

print(Vender)
Vender.makeLatte(size: .small,withSugar: false)
print(Vender)
Vender.makeEspresso(withSugar: false)
print(Vender)
Vender.makeCappuchino(size: .medium, withSugar: true)
print(Vender)
Vender.makeAmericano(size: .medium, withSugar: true)
Vender.refillCoffe(10)
Vender.makeAmericano(size: .medium, withSugar: true)
print(Vender)

//Задание 2
//Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

