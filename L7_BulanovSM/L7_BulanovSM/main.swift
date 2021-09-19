//
//  main.swift
//  L7_BulanovSM
//
//  Created by Сергей Буланов on 18.09.2021.
//

import Foundation
//  1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
class userBase {
    var userName: String?
    var userAge: Int?
    init(userName: String?, userAge: Int?) {
    self.userName = userName
        self.userAge = userAge
        
    }
    func welcomeUser() {
        if userName != nil {
            print("Welcome \(userName!)")
        } else {
            print("Введите имя пользователя")
        }
    }
    func testAges() {
        guard userAge! >= 18 else {
            return print ("Необходимо подтверждение родителей")
        }
        print("Вам уже \(userAge!). Всё окей!")
    }
}

var Andrew = userBase(userName: "Andrew", userAge: 18)
Andrew.testAges()
Andrew.welcomeUser()

//  2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
enum fatalErrors: Error {
    case youAreNotCent
    case YouTooSmall
}

enum gameRoles {
    case PG
    case SG
    case SF
    case PF
    case C
}


class player {
    var playerName: String
    var playerClub: String
    var playerPosition: gameRoles?
    var playerHeight: Double
    
    init(playerName: String, playerClub: String, playerPosition: gameRoles, playerHeight: Double) {
        self.playerName = playerName
        self.playerClub = playerClub
        self.playerPosition = playerPosition
        self.playerHeight = playerHeight
    }
    
   
    func playerTest() throws  {
        guard playerPosition == .C else {
            throw fatalErrors.youAreNotCent
        }
    }
        
        func playerCheck() throws {
            guard playerHeight > 6.7 else {
                throw fatalErrors.YouTooSmall
            }
        }
    
    
    
        
}
    



do {
    let KD = try player(playerName: "KD", playerClub: "BROOKLYN", playerPosition: .PF, playerHeight: 7.0)
    try KD.playerTest()
} catch fatalErrors.YouTooSmall {
    print("Ты СЛИШКОМ МАЛЕНЬКИЙ")
} catch fatalErrors.youAreNotCent {
    print("ты не центр") }



do {
    let SC = try player(playerName: "Steph", playerClub: "GsW", playerPosition: .PG, playerHeight: 6.5)
    try SC.playerCheck()
} catch fatalErrors.YouTooSmall {
    print("Ты СЛИШКОМ МАЛЕНЬКИЙ")
} catch fatalErrors.youAreNotCent {
    print("ты не центр") }


var players = [
    player.init(playerName: "KD", playerClub: "Brooklyn", playerPosition: .PF, playerHeight: 6.9),
    player.init(playerName: "Steph", playerClub: "GoldenState", playerPosition: .PG, playerHeight: 6.5),
    player.init(playerName: "Bam", playerClub: "miami", playerPosition: .C, playerHeight: 7.0),
    player.init(playerName: "DBook", playerClub: "SunsOnFourXD", playerPosition: .SG, playerHeight: 6.7),
    player.init(playerName: "Giannis", playerClub: "Bucks", playerPosition: .PF, playerHeight: 7.1)
    
]

for player in players {
    do {
        try player.playerCheck()
        try player.playerTest()
    } catch fatalErrors.YouTooSmall {
        print("\(player.playerName), ты СЛИШКОМ МАЛЕНЬКИЙ")
    } catch fatalErrors.youAreNotCent {
        print("\(player.playerName), ты не центр") }
}
