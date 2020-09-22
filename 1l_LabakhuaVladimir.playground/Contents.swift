import UIKit
import Foundation

//Задание 1
//Решить квадратное уравнение
 print("Решим квадратное уравнение типа ax^2 + bx + c = 0")

//Введем коэффиециенты уравнения
let a:Float = -1 //должен быть !=0
let b:Float = -2
let c:Float = 15

//Полученное уравнение выглядит следующим образом
print("Полученное уравнение: \(a) * x^2 + ( \(b) * x ) + ( \(c) ) = 0")

//Вычислим дискриминант
var d:Float = pow(b, 2)-4*a*c
print("Дискриминант равен \(d)")

//Сообщим о результате вычисления дискриминанта и вычислим корни
if (d<0) {
    print("Корней нет")
} else if (d>0) {
    print("Корней будет два")
    let Xone = (-1 * b + sqrt(d)) / 2 * a
    let Xtwo = (-1 * b - sqrt(d)) / 2 * a
    print("Первый корень \(Xone)")
    print("Второй корень \(Xtwo)")
} else {
    print("Есть ровно один корень")
    let X = (-1*b)/2*a
    print("Корень уравнения \(X)")
}

//Задание 2
//Даны катеты прямоугольного тереугольника найти площадь периметр и гипотенузу треугольника

print("Дан прямоугольный треугольник ABC")

//Введем длины катетов
let AB:Float = 3
let BC:Float = 4

print("Катет AB = \(AB)")
print("Катет BC = \(BC)")

//Найдем гопотенузу треугольника ABC
let AC:Float = sqrt(pow(AB, 2) + pow(BC, 2))
print("Гипотенуза AC = \(AC)")

//Найдём площадь треугольника ABC
let Sabc = (AB * BC) / 2
print("Площадь треугольника ABC = \(Sabc)")

//Найдем периметр треугольника ABC
let Pabc = AB + BC + AC
print("Периметр треугольника ABC = \(Pabc)")

//Задание 3
//Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет

let years:Int = 5 // на сколько лет удержан вклад
print("Вычислим сумму вклада через \(years) лет")

//Введем необходимые данные
var deposit:Double = 12500 //сумма депозита
let percent:Double = 5.5 //процент под который удержан вклад

print("Вы указали сумму вклада: \(deposit)")
print("Вы указали процентную ставку: \(percent)%")

//Вычислим изменение вклада
let deposinPrimordial = deposit
var depositFinal = deposit

for i in 1...years {
    depositFinal = (deposit * (percent*0.01)) + deposit
    print("Размер вклада за \(i) год: \(NSString(format: "%.2f", depositFinal)) ")
    deposit = depositFinal
}

//Отобразим изменения нашего вклада и посчитаем прибыль
print("Сумма вклада увеличилась с \(deposinPrimordial) до \(NSString(format: "%.2f", depositFinal))")
let profit = depositFinal - deposinPrimordial
print("Прибыль составила \(NSString(format: "%.2f", profit))")

//Конец домашнего задания
