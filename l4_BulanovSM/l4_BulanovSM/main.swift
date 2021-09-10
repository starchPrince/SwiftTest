//
//  main.swift
//  l4_BulanovSM
//
//  Created by Сергей Буланов on 08.09.2021.
//

import Foundation

class Car {
    var carBrand: String
    var yearOfRelease: Int
    var color: String
    init(carBrand: String, yearOfRelease: Int, color: String) {
        self.carBrand = carBrand
        self.yearOfRelease = yearOfRelease
        self.color = color
    }
    func optionalInfo () {
        
    }
}

 class sportCar: Car {
    enum hatch {
        case yes
        case no
    }
    
 var maxSpeed: Int
 var price: String
    var hatchStatus: hatch
 init(carBrand: String,yearOfRelease: Int,color: String ,maxSpeed: Int, price: String, hatchStatus: hatch ) {
 self.maxSpeed = maxSpeed
 self.price = price
    self.hatchStatus = hatchStatus
    super.init(carBrand: carBrand, yearOfRelease: yearOfRelease, color: color)
 }
    override func optionalInfo() {
        if hatchStatus == .yes {
            print("тут ещё и люк есть!!")
        } else {
            print("сегодня без люка = (")
        }
    }
 }

 class trunkCar: Car {
    enum trailer {
        case yes
        case no
    }
 var maxLoad: Int
 var capacity: Int
    var trailerStatus: trailer
    init(carBrand: String,yearOfRelease: Int,color: String ,maxLoad: Int, capacity: Int, trailerStatus: trailer) {
        self.maxLoad = maxLoad
        self.capacity = capacity
        self.trailerStatus = trailerStatus
        super.init(carBrand: carBrand, yearOfRelease: yearOfRelease, color: color)
    }
    override func optionalInfo() {
        if trailerStatus == .yes {
            print("Прицеп есть")
        } else {
            print("Прицепа нет")
        }
    }
 }


var aa = trunkCar(carBrand: "Gazel", yearOfRelease: 1990, color: "Green", maxLoad: 800, capacity: 4, trailerStatus: .no)
aa.optionalInfo()
var bb = trunkCar(carBrand: "Scania", yearOfRelease: 1974, color: "Black", maxLoad: 3, capacity: 3, trailerStatus: .yes)
bb.optionalInfo()

var zz = sportCar(carBrand: "Lada", yearOfRelease: 2023, color: "Red", maxSpeed: 600, price: "бесценна", hatchStatus: .yes)
zz.optionalInfo()
var vv = sportCar(carBrand: "Honda", yearOfRelease: 2007, color: "Blue", maxSpeed: 180, price: "1.6", hatchStatus: .no)
vv.optionalInfo()

