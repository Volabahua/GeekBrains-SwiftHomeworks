import UIKit

//Задание 1
//Написать функцию, которая определяет, четное число или нет.

let randomNumber: Int = 42

func isNumEven(num: Int) {
    num%2 == 0 ? print("Число \(num) четное") : print("Число \(num) нечетное")
}
    
isNumEven(num: randomNumber)

//Задание 2
//Написать функцию, которая определяет, делится ли число без остатка на 3.

func isMultipleOfThreen(num: Int) {
    num%3 == 0 ? print("Число \(num) кратно трём") : print("Число \(num) не кратно трём")
}

isMultipleOfThreen(num: randomNumber)

//Задание 3
//Создать возрастающий массив из 100 чисел.

let arrayHundred = []

var a = Int.random(in: 1...100)
