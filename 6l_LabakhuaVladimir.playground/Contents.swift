import UIKit

//Задание 1
//Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

protocol TriangleProtocol {
    var AB:Double {get set}
    var BC:Double {get set}
    var AC:Double {get set}
    var perimetr:Double {get set}
    var area:Double {get set}
}

protocol QuadrangleProtocol {
    var AB:Double {get set}
    var BC:Double {get set}
    var CD:Double {get set}
    var AD:Double {get set}
    var perimetr:Double {get set}
    var area:Double {get set}
}

protocol CircleProtocol {
    var radius:Double {get set}
    var diametr:Double {get set}
    var perimetr:Double {get set}
    var area:Double {get set}
}

protocol Colored{
    var color: UIColor {get set}
}

protocol Weightabe{
    var weight: Double {get set}
}

class RightTriangle: TriangleProtocol, Weightabe, Colored {
    var weight: Double
    var color: UIColor
    var AB: Double
    var BC: Double
    var AC: Double
    var perimetr:Double
    var area:Double
    
    init(AB: Double, BC: Double, weight: Double, color: UIColor){
        self.AB = AB
        self.BC = BC
        self.AC = {sqrt(pow (AB, 2)+pow(BC, 2))}()
        self.weight = weight
        self.perimetr = {AB+BC+sqrt(pow (AB, 2)+pow(BC, 2))}()
        self.area = {(AB*BC)/2}()
        self.color = color
    }
}

class Rectangle: QuadrangleProtocol, Weightabe, Colored {
    var weight: Double
    var color: UIColor
    var AB: Double
    var BC: Double
    var CD: Double
    var AD: Double
    var perimetr:Double
    var area:Double
    
    
    init(AB: Double, BC: Double, weight: Double, color: UIColor) {
        self.AB = AB
        self.BC = BC
        self.CD = AB
        self.AD = BC
        self.weight = weight
        self.perimetr = {(AB+BC)*2}()
        self.area = {AB*BC}()
        self.color = color
    }
}

class Circle: CircleProtocol, Weightabe, Colored {
    var weight: Double
    var color: UIColor
    var radius: Double
    var diametr: Double
    var perimetr: Double
    var area: Double
    
    init(radius:Double, weight: Double, color: UIColor) {
        self.radius = radius
        self.diametr = {radius*2}()
        self.perimetr = {2*Double.pi*radius}()
        self.area = {pow(radius, 2)*Double.pi}()
        self.weight = weight
        self.color = color
    }
}

struct queue<T: Weightabe> {
    private var elements: [T] = []
    
    var totalWeght : Double {
        var weight = 0.0
        for element in elements {
            weight += element.weight
        }
        return weight
    }
    
    mutating func add(_ element: T) {
        elements.append(element)
    }
    mutating func deletFirst() -> T? {
        return elements.removeFirst()
    }
    mutating func deletLast() -> T? {
        return elements.removeLast()
    }
    mutating func clear() -> T? {
        return elements.removeAll() as? T
    }
}

//Задание 2
//Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)



//Задание 3*
//Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.




var stackTriangles = queue<RightTriangle>()

stackTriangles.add(RightTriangle(AB: 3, BC: 3, weight: 5, color: .green))
stackTriangles.add(RightTriangle(AB: 4, BC: 6, weight: 9, color: .red))
stackTriangles.add(RightTriangle(AB: 5, BC: 2, weight: 3, color: .orange))
stackTriangles.add(RightTriangle(AB: 2, BC: 6, weight: 7, color: .green))

