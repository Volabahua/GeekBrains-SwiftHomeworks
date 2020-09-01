import UIKit

//Задание 1
//Написать функцию, которая определяет, четное число или нет.

//Создадим случайное число от 1 до 100 для проверки в первых двух заданиях.
let randomNumber: Int = Int.random(in: 1...100)

//функция проверяет на чётность.
func isNumEven(num: Int) {
    num%2 == 0 ? print("Число \(num) четное") : print("Число \(num) нечетное")
}

//Проверим наше рандомное число на четность.
isNumEven(num: randomNumber)

//Задание 2
//Написать функцию, которая определяет, делится ли число без остатка на 3.

//Функция проверяет на кратность трём.
func isMultipleOfThreen(num: Int) {
    num%3 == 0 ? print("Число \(num) кратно трём") : print("Число \(num) не кратно трём")
}

//Проверим наше рандомное число на кратность трём.
isMultipleOfThreen(num: randomNumber)

//Задание 3
//Создать возрастающий массив из 100 чисел.

//Функция создает массив из ста элементов. Первый элемент случайное число от 1 до 5. в процессе работы к каждому последующему элементу прибавляется слуайное число от 1 до 5.
func arrayBuilder(array: [Int] ) -> [Int] {
    var newArray = array
    var randomNum = Int.random(in: 1...5)
    for _ in 1...100 {
        newArray.append(randomNum)
        randomNum += Int.random(in: 1...5)
    }
    return newArray
}

//Создадим возрастающий массив из ста случайных Int чисел.
var myArray = arrayBuilder(array: [])
print("Получен возрастающий массив из 100 элементов: \(myArray)")

//Задание 4
//Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

//Функция проверяет каждый элемент массива на нечётность и кратность трём и оставляет только те которые отвечают обоим условиям.
func arrayMultipleFilter(array: [Int]) -> [Int] {
    return array.filter({$0 % 2 != 0 && $0 % 3 == 0})
}

//Получим массив все элементы которого отвечают условию.
myArray = arrayMultipleFilter(array: myArray)

//Профильтруем полученный нами массив из 100 элементов оставив только нечётные элементы кратные трём.
print("Нечётные элементы массива которые кратны трём \(arrayMultipleFilter(array: myArray))")

//Задание 5*
//Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.

//Функция создает возрастающий массив из 100 чисел фибоначчи
func fibonacchiArrayBuilder(array:[Double]) -> [Double] {
    var newArray = array
    for i in 0...99 {
        if i<2 {
            newArray.append(1)
        } else {
            newArray.append(newArray[i-1]+newArray[i-2])
        }
    }
    return newArray
}

//Пробую создать массив с помощью функции
var myFiboArr = [Double]()
myFiboArr = fibonacchiArrayBuilder(array: myFiboArr)

//Задание 6*
//Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу.

//Функция создаёт массив из чисел от 2 до n
func arrayPrimeBuilder( legnth: Int ) -> [Int] {
    var newArray = [Int]()
    var num = 2
    for _ in 1...legnth {
        newArray.append(num)
        num += 1
    }
    return newArray
}

var primeArray = arrayPrimeBuilder(legnth: 100)

//Проверим простое ли число.
func isPrime(_ number: Int) -> Bool {
return number > 1 && !(2..<number).contains { number % $0 == 0 }
}

isPrime(5)

/* Попытка

//Проверим простое ли число.
func isPrime(_ number: Int) -> Bool {
return number > 1 && !(2..<number).contains { number % $0 == 0 }
}

func goToPrime(_ array: [Int]) -> [Int]{
    var newArray = array
    for element in newArray {
        if isPrime(element) == true {
            newArray.append(element)
        } else {
            continue
        }
    }
    print(newArray)
    return newArray
}

print(goToPrime(myPrimeArray))*/


