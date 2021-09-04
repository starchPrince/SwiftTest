//
//  main.swift
//  3l_BulanovS
//
//  Created by Сергей Буланов on 04.09.2021.
//

import Foundation

//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.


enum engine {
    case on
    case off
}
enum windows {
    case open
    case close
}

enum volume {
    case load
    case unload
}



struct SportCar {
    var carBrand: String
    var yearOfRelease: Int
    var trunkVolume: Int
    //var engineStatus: engine
    var windowsStatus: windows
    //var trunkStatus: volume
    
    mutating func openWindows () {
        self.windowsStatus = .open
    }
    
    mutating func closedWindows () {
        self.windowsStatus = .close
    }
    
    
}
struct TrunkCar {
    var trunkBrand: String
    var yearOfRelease: Int
    var bodyVolume: Int
    var engineStatus: engine
    //var windowsStatus: windows
    //var bodyStatus: volume
    
    mutating func engineOn () {
        self.engineStatus = .on
    }
    mutating func engineOff () {
        self.engineStatus = .off
    }
    
}

var sportCar2 = SportCar(carBrand: "Mustang", yearOfRelease: 2020, trunkVolume: 0, windowsStatus: .close)
print(sportCar2)
var sportCar1 = SportCar(carBrand: "VAZ", yearOfRelease: 2003, trunkVolume: 5, windowsStatus: .open)
print(sportCar1)

var trunk1 = TrunkCar(trunkBrand: "Scania", yearOfRelease: 1990, bodyVolume: 3000, engineStatus: .off)
var trunk2 = TrunkCar(trunkBrand: "Gazel", yearOfRelease: 2023, bodyVolume: 10000, engineStatus: .on)
print(trunk1)
print(trunk2)
