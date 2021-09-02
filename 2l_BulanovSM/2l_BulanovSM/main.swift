//
//  main.swift
//  2l_BulanovSM
//
//  Created by Сергей Буланов on 29.08.2021.
//

import Foundation

//Строка проверки тест в ту сторону

// 1.1 Написать функцию, которая определяет, четное число или нет.
func evenOrOdd (_ x: Int){
    if x%2 == 0 {
        print("число \(x) является четным")
    } else {
        print("число \(x) является нечетным")
    }
}
evenOrOdd(102)
    
    // 2 Написать функцию, которая определяет, делится ли число без остатка на 3.

func check (_ y: Int) {
    if y%3 == 0 {
        let t = y / 3
        print("Число \(y) делится на три без остатка. Если \(y) поделить на 3 получится \(t)")
    } else {
        print("Не делится, попробуй другое число")
    }
}
check(12)
    
    

// 3. Создать возрастающий массив из 100 чисел.

var lineArray = Array(1...100)

// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for element in lineArray where (element % 2 == 0) || (element % 3 == 0) {
    if let index = lineArray.firstIndex(of: element) {
        lineArray.remove(at: index)
    }
}
print(lineArray)
 
// 5 Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.

func fibonacci ()  {
    var array = [0, 1]
    while array.count < 50 {
        array.append(array[array.count - 1] + array[array.count - 2])
    }
    print(array)
    //print(array.count)
}

fibonacci()
 

// 6 Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу.

func isPrime(num: Int) -> Bool {
    if num < 2 {
        return false
    }
    
    for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    
    return true
}


func randomPrimeArray(){
    var result = [Int]()
    
    while result.count < 100 {
        let h = Int(arc4random_uniform(100))
        if isPrime(num: h) {
            result.append(h)
        }
    }
    print(result)
    //print(results.count)
}
randomPrimeArray()

