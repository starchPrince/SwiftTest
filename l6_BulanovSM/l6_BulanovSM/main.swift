//
//  main.swift
//  l6_BulanovSM
//
//  Created by Сергей Буланов on 16.09.2021.
//

import Foundation

//  1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//  2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//  3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

struct Queue<qweqwe: Equatable> {
    var items = [qweqwe]()
    mutating func enqueue(_ element: qweqwe) {
        items.append(element)
    }
    mutating func dequeue() -> qweqwe? {
        return items.removeFirst()
    }
    
    mutating func filter (_ filtter: (qweqwe) -> Bool) -> [qweqwe] {
        var result = [qweqwe]()
        for i in items {
            if filtter(i) {
                result.append(i)
            }
        }
        return result
    }
    
    subscript (index: Int) -> qweqwe? {
        if index < items.count {
            return items[index]
        }
        return nil
        }
    }


var z = Queue<Int>()
for i in 1...25 {
    z.enqueue(i)
}


 let testfilter = z.filter() {$0 % 3 == 0}
print(z)
print(testfilter)
print(z[2])
