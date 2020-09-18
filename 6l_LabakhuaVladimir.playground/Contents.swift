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

//Настраиваем вывод класса в консоль
extension RightTriangle: CustomStringConvertible {
    var description: String {
        return "\nПрямоугольный треугольник со сторонами AB: \(AB), BC: \(BC), AC: \(NSString(format: "%.2f", AC)) \nПериметр треугольника: \(NSString(format: "%.2f", perimetr)) \nПлощадьТреугольника: \(NSString(format: "%.2f", area)) \nВес объекта: \(weight)"
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

//Настраиваем вывод класса в консоль
extension Rectangle: CustomStringConvertible {
    var description: String {
        return "\nПрямоугольник со сторонами AB: \(AB), BC: \(BC), CD: \(CD), AD: \(AD) \nПериметр прямоугольника: \(perimetr) \nПлощадь прямоугольника: \(NSString(format: "%.2f", area)) \nВес объекта: \(weight)"
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

//Настраиваем вывод класса в консоль
extension Circle: CustomStringConvertible {
    var description: String {
        return "\nКруг с радиусом: \(radius), диаметром: \(diametr)\nДлина окружности: \(NSString(format: "%.2f", perimetr)) \nПлощадь круга: \(NSString(format: "%.2f", area)) \nВес объекта: \(weight)"
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
    
//Задание 2
//Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
    
    mutating func add(_ element: T) {
        elements.append(element)
    }
    mutating func deletFirst() -> T? {
        print("Удален первый добавленный элемент")
        return elements.removeFirst()
    }
    mutating func deletLast() -> T? {
        print("Удален последний добавленный элемент")
        return elements.removeLast()
    }
    mutating func clear() -> T? {
        print("Удалены все элементы структуры")
        return elements.removeAll() as? T
    }
    
//Задание 3*
//Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
    
    subscript(indices: UInt ...) -> Void {
        var weight = 0.0
        for index in indices where index < self.elements.count {
            weight += self.elements[Int(index)].weight
        }
        return print("Суммарный вес объектов: \(weight)")
    }
    
    subscript(index: UInt) -> Void? {
        guard index < self.elements.count else {return nil}
        return print("Элемент \(index) в структуре:\(self.elements[Int(index)])")
    }
    
}

//Создадим структуру которая хранит Треугольники
var stackTriangles = queue<RightTriangle>()

//Добавим треугольники
stackTriangles.add(RightTriangle(AB: 3, BC: 3, weight: 5, color: .green))
stackTriangles.add(RightTriangle(AB: 4, BC: 6, weight: 9, color: .red))
stackTriangles.add(RightTriangle(AB: 5, BC: 2, weight: 3, color: .orange))
stackTriangles.add(RightTriangle(AB: 2, BC: 6, weight: 7, color: .green))

//Выведем почученное значение и общий вес объектов
print(stackTriangles)
print(stackTriangles[0,1,3])
print(stackTriangles[2])

//Создадим структуру которая хранит Прямоугольники
var stackRectangles = queue<Rectangle>()

//Добавим прямоугольники
stackRectangles.add(Rectangle(AB: 4, BC: 5, weight: 7, color: .black))
stackRectangles.add(Rectangle(AB: 3, BC: 8, weight: 9, color: .red))
stackRectangles.add(Rectangle(AB: 6, BC: 4, weight: 5, color: .blue))
stackRectangles.add(Rectangle(AB: 3, BC: 3, weight: 10, color: .white))
stackRectangles.add(Rectangle(AB: 10, BC: 3, weight: 12, color: .blue))

//Выведем почученное значение и общий вес объектов
print(stackRectangles)
print(stackRectangles[1,4])
print(stackRectangles[1])

//Создадим структуру которая хранит Окружности
var stackCircles = queue<Circle>()

//Добавим окружности
stackCircles.add(Circle(radius: 3, weight: 5, color: .black))
stackCircles.add(Circle(radius: 4, weight: 7, color: .red))
stackCircles.add(Circle(radius: 5, weight: 9, color: .brown))
stackCircles.add(Circle(radius: 6, weight: 11, color: .green))
stackCircles.add(Circle(radius: 7, weight: 13, color: .white))

//Выведем почученное значение и общий вес объектов
print(stackCircles)
print(stackCircles[0,2,3])
print(stackCircles[3])
print(stackCircles[10])

//Конец домашнего задания
