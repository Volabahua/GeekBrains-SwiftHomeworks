import UIKit

//Задание 1
//Написать функцию, которая определяет, четное число или нет.

//Создадим случайное число от 1 до 100 для проверки в первых двух заданиях.
let randomNumber: Int = Int.random(in: 1...100)

//функция проверяет на чётность
func isNumEven(num: Int) {
    num%2 == 0 ? print("Число \(num) четное") : print("Число \(num) нечетное")
}

//Проверим наше рандомное число на четность
isNumEven(num: randomNumber)

//Задание 2
//Написать функцию, которая определяет, делится ли число без остатка на 3.

//функция проверяет на кратность трём
func isMultipleOfThreen(num: Int) {
    num%3 == 0 ? print("Число \(num) кратно трём") : print("Число \(num) не кратно трём")
}

//Проверим наше рандомное число на кратность трём
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

//Создадим возрастающий массив из ста случайных Int чисел
let myArrayHundred = arrayBuilder(array: [])
print(myArrayHundred)

