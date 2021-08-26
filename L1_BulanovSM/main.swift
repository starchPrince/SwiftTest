//
//  main.swift
//  L1_BulanovSM
//
//  Created by Сергей Буланов on 26.08.2021.
//

import Foundation

//1. Решить квадратное уравнение.
let a: Double = 3
let b: Double = 7
let c: Double = -6
let d = b*b - 4 * a * c

var x1 = (-b + sqrt(d)) / (2*a)
var x2 = (-b - sqrt(d)) / (2*a)

print("Уравнение решено. Первый корень  = \(x1), второй  = \(x2)")
//2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

let ab = 6
let bc = 8
let s =  (ab * bc) / 2
let cd = Int(sqrt(Double(ab*ab + bc*bc)))
let p = ab + bc + cd

print("Площадь треугольника равна \(s) см2")
print("Гипотенуза треугольника \(cd) см")
print("Периметр треугольника \(p) см")

//3. Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

var deposite  = 1000
let percent = 8
let years = 5

for _ in 1...years {
    deposite += (deposite * percent/100)
}
print("Сумма на счету через 5 лет \(deposite)")

    //или

var deposite2  = 1000
let percent2 = 8
deposite2 += (deposite2 * percent2/100)
deposite2 += (deposite2 * percent2/100)
deposite2 += (deposite2 * percent2/100)
deposite2 += (deposite2 * percent2/100)
deposite2 += (deposite2 * percent2/100)

print(deposite2)
