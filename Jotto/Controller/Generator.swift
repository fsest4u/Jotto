//
//  Happen.swift
//  Jotto
//
//  Created by spdevapp on 2020/07/21.
//  Copyright © 2020 hyeon. All rights reserved.
//

import Foundation
import UIKit

class Generator {
        
    var games = [JottoGame]()
    var items = [JottoNumber]()

    var posx: CGFloat?
    var posy: CGFloat?
    var width: CGFloat?
    var height: CGFloat?
    
    let minItemNum = 1
    let maxItemNum = 45
    let cntItemNum = 6
    let cntGameNum = 5

    let minFontSize: CGFloat = 40
    let maxFontSize: CGFloat = 60
    
    func initItem(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) {
        print("initItem...")

        self.posx = x
        self.posy = y
        self.width = w
        self.height = h
        
        print("x : \(posx), y : \(posy), w : \(width), h : \(height)")

    }
    
    func removeJottoGame() {
        games.removeAll()
    }

    
    func getJottoGame() -> [JottoGame] {
        
        removeJottoGame()
        for _ in 1...cntGameNum {
            let item = getJottoItem()
            let game = JottoGame(game: item)
            games.append(game)
        }
        
        return games
    }
    
    func getJottoItem() -> [JottoNumber] {
        
        items.removeAll()
        for _ in 1...cntItemNum {
            items.append(getJottoNumber())
        }
        
        return items
    }
    
    func getJottoNumber() -> JottoNumber {
        
        let number = getRandomNumber()
        
        let item = JottoNumber(number: number)
        
        return item
    }

    
    
    func getRandomNumber() -> Int {
        
        var number = Int.random(in: minItemNum...maxItemNum)
        
        for item in items {
            while number == item.number {
                number = Int.random(in: minItemNum...maxItemNum)
            }
        }
        
        return number
        
    }
    
//    func getRandomPosX() -> Int {
//
//        var pos: CGFloat
//        repeat {
//            pos = CGFloat.random(in: posx!...width!)
//        } while pos >= (self.width! - 100)
//
//        return Int(pos)
//
//    }
//
//    func getRandomPosY() -> Int {
//
//        var pos:CGFloat
//        repeat {
//            pos = CGFloat.random(in: posy!...height!)
//        } while pos >= (self.height! - 150)
//        return Int(pos)
//
//    }
//
//    func getRandomFontSize() -> Int {
//
//        let size = CGFloat.random(in: minFontSize...maxFontSize)
//        return Int(size)
//
//    }
//
//    func getRandomColor() -> UIColor {
//
//        let randomRed:CGFloat = CGFloat(drand48())
//        let randomGreen:CGFloat = 0.5//CGFloat(drand48())
//        let randomBlue:CGFloat = CGFloat(drand48())
//
//        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
//
//    }


}


class JottoNumber {
    
    var number: Int
    
    init(number: Int) {
        self.number = number
    }
}

class JottoGame {
    
    var game: [JottoNumber]
    
    init(game: [JottoNumber]) {
        self.game = game
    }
}
