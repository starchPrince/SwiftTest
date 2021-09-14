//
//  main.swift
//  l5_BulanovSM
//
//  Created by Сергей Буланов on 12.09.2021.
//

import Foundation


//  1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//  2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//  3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//  4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//  5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//  6. Вывести сами объекты в консоль.

enum engineStatus {
    case off, on
}
enum windowsStatus {
    case open, close
}


protocol Car {
    var brand: String {get}
    var yearOfRelease: Int {get}
    var color: String {get}
    func carInfo()
}

extension Car {
    func engineOnOf(engine: engineStatus) {
        switch engine {
        case .on:
            print("мотор заведен")
        case .off:
            print("мотор выключен")
        }
    }
}


extension Car {
    func windowsOnOf(windows: windowsStatus) {
        switch windows {
        case .open:
            print("Окна открыты")
            case .close:
                print("Окна закрыты")
        }
        
    }
}
class SportCar: Car, CustomStringConvertible {
    var brand: String
    var yearOfRelease: Int
    var color: String
    var description: String
    var maxSpeed: Int
    init (brand: String, yearOfRelease: Int, color: String, description: String, maxSpeed: Int) {
        self.brand = brand
        self.yearOfRelease = yearOfRelease
        self.color = color
        self.description = description
        self.maxSpeed = maxSpeed
    }
    
    func carInfo() {
        print("""
              Марка авто: \(brand)
              Год выпуска: \(yearOfRelease)
              Цвет: \(color)
              Максимальная скорость: \(maxSpeed)
              Использование CustomStringConvertible: \(description)
              """)
    }
    
    }
    
var bugaddi = SportCar(brand: "Bugaddi", yearOfRelease: 1999, color: "Black", description: "использовал", maxSpeed: 250)
bugaddi.engineOnOf(engine: .on)
bugaddi.windowsOnOf(windows: .close)
bugaddi.carInfo()

class trunkCar: Car, CustomStringConvertible {
    var brand: String
    var yearOfRelease: Int
    var color: String
    var description: String
    var MaxValue: Int
    init (brand: String, yearOfRelease: Int, color: String, description: String, MaxValue: Int) {
        self.brand = brand
        self.yearOfRelease = yearOfRelease
        self.color = color
        self.description = description
        self.MaxValue = MaxValue
    }
    
    func carInfo() {
        print("""
              Марка авто: \(brand)
              Год выпуска: \(yearOfRelease)
              Цвет: \(color)
              Максимальная вместимость: \(MaxValue) т.
              Использование CustomStringConvertible: \(description)
              """)
    }
    
}
var kamaz = trunkCar(brand: "VAZ", yearOfRelease: 2009, color: "Red", description: "и тут использовал", MaxValue: 3)
kamaz.windowsOnOf(windows: .open)
kamaz.engineOnOf(engine: .off)
kamaz.carInfo()
