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
        
        items = items.sorted(by: {$0.number < $1.number})

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
