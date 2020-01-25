import Foundation
// Задание 1: решить квадратное уравнение

func squareRoot(num: Int) -> Int {
    let sqrt = Int(Double(num).squareRoot())
    return sqrt
}

func squaring(num: Int) -> Int {
    let sqr = num * num
    return sqr
}

//вводимое квадратное уравнение: 3x^2-14x-5=0
// 3 коэфициента уравнения
var a = 3
var b = -14
var c = -5
var x: Int = 0

//вывод уравнения в консоль
print("Задание №1: Решить квадратное уравнение \(a)x^2 + \(b) + \(c) = 0 \n")

//дискриминант
var d = squaring(num: b) - (4*a*c)

if d < 0 {
    print("Квадратное уравнение не имеет корней\n")
} else if d == 0 {
    x = -b / (2*a)
    print("Единственный корень квадратного уравнения - \(x)\n")
} else if d > 0 {
    let sqrtD = squareRoot(num: d) // упрощаем let sqrtD = Int(Double(d).squareRoot())
    print("Уравнение имеет два корня")
    let x1 = (Double(-b) + Double(sqrtD)) / Double(2*a)
    let x2 = (Double(-b) - Double(sqrtD)) / Double(2*a)
    print("Первый корень уравнения: \(x1) \nВторой корень уравнения: \(x2)\n\n")
}


//Задание 2: Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу прямоугольника

var firstCathet = 4 //первый катет
var secondCathet = 2 //второй катет

print("Задание №2: Найти площадь, периметр и гипотенузу прямоугольника, катеты которого равны \(firstCathet) и \(secondCathet)\n")

var square = firstCathet * secondCathet / 2 //площадь прямоугольного треугольника
var hypotenuse = squareRoot(num: (squaring(num: firstCathet) + squaring(num: secondCathet))) //гипотенуза с отброшенными знаками после запятой
var perimeter = firstCathet + secondCathet + Int(hypotenuse) //периметр

print("Площадь - \(square)\nПериметр - \(perimeter)\nГипотенуза - \(hypotenuse)\n\n")


//Задание №3: Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

var depositeTerm = 5 //срок вклада в годах
var depositeArray: [Int] = [] // массив с элементами депозита
var depositeSize = 5000 //ввод суммы депозита
var percent = 0.05 //процентная ставка по депозиту
var amount = depositeSize
print("Задание №3: Вклад в банк составляет \(depositeSize) под \(percent*100)%. Срок вклада \(depositeTerm) лет. Нужно найти сумму вклада через \(depositeTerm) лет.\n")
for var i in 1...depositeTerm {
    let deposite = Double(amount) + Double(amount) * 0.05
    amount = Int(deposite)
    depositeArray.append(amount)
    i += 1
}
print("Сумма вклада через \(depositeTerm) лет равна \(depositeArray[depositeArray.count-1])\n\nРаспределение по годам:\n")
for var i in 0..<depositeTerm {
    print ("Размер вклада после \(i+1) года \(depositeArray[i])")
    i += 1
}

