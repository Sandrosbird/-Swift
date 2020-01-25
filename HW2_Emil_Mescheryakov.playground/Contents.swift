import UIKit

//Задание 1. Функция, определяющая, четное число или нет
func isTheNumEven(num: Int) -> Bool {
   return num % 2 == 0
}

//Задание 2. Функция, определяющая, делится ли число на 3 без остатка
func dividedByThree(num: Int) -> Bool {
   return num % 3 == 0
}

//Функция, удаляющая из массива все четные элементы
func delEvenFromArray(array: [Int]) -> [Int] {
    var oddArray: [Int] = []
    for element in array {
        if !isTheNumEven(num: element) {
            oddArray.append(element)
        }
    }
    return oddArray
}

//функция, удаляющая элементы, которые делятся на 3
func delDividedByThree(array: [Int]) -> [Int] {
    var notDivisibleByThree: [Int] = []
        for element in array {
            if !dividedByThree(num: element) {
                notDivisibleByThree.append(element)
            }
        }
    return notDivisibleByThree
}

//Задание 3. Возрастающий массив из 100 чисел
func getIncreasingArray(numOfElements: Int) -> [Int] {
    var n = 0
    var array: [Int] = []
    while n <= numOfElements-1 {
        array.append(n)
        n += 1
    }
    return array
}

//НЕУДАЧНАЯ ВЕРСИЯ (версия с рандомными числами, распооженными по порядку, но повторяющимися)
//func getIncreasingArray(numOfElements: Int) -> [Int] {
//    var n = 0
//    var array: [Int] = []
//    while n <= numOfElements-1 {
//        array.append(Int(arc4random_uniform(UInt32(numOfElements))))
//        n += 1
//    }
//    return array.sorted()
//}

getIncreasingArray(numOfElements: 2)
var num = getIncreasingArray(numOfElements: 100)
num.count

//Задание 4. Удалить из массива все четные числа и все чила, которые делятся на 3
var num1 = delEvenFromArray(array: num)
delDividedByThree(array: num1)

//Задание 5. Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
//var fibbonacciArray: [Decimal] = []
//func addNextFibbonacci(decimalArray: [Decimal]) -> [Decimal] {
//    if fibbonacciArray == [] {
//        fibbonacciArray.append(0)
//        fibbonacciArray.append(1)
//    } else {
//        fibbonacciArray.append(
//    }
//    return fibbonacciArray
//}
