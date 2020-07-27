//
//  Happen.swift
//  Jotto
//
//  Created by spdevapp on 2020/07/21.
//  Copyright © 2020 hyeon. All rights reserved.
//

import Foundation
import UIKit

class GeneratorNumber {
        
    var games = [JottoGame]()
    var items = [JottoNumber]()

    var posx: CGFloat?
    var posy: CGFloat?
    var width: CGFloat?
    var height: CGFloat?
        
    
    func removeJottoGame() {
        games.removeAll()
    }

    // The one game is five items
    func getJottoGame() -> [JottoGame] {
        
        removeJottoGame()
        for _ in 1...GAME_NUM_CNT {
            let item = getJottoItem()
            let game = JottoGame(game: item)
            games.append(game)
        }
        
        return games
    }
    // The one item is six numbers
    func getJottoItem() -> [JottoNumber] {
        
        items.removeAll()
        for _ in 1...ITEM_NUM_CNT {
            items.append(getJottoNumber())
        }
        
        items = items.sorted(by: {$0.number < $1.number})

        return items
    }
    // The one number is random number of fortune
    func getJottoNumber() -> JottoNumber {
        
        let number = getRandomNumber()
        
        let item = JottoNumber(number: number)
        
        return item
    }

    func getRandomNumber() -> Int {
        
        var number = Int.random(in: ITEM_NUM_MIN...ITEN_NUM_MAX)
        
        for item in items {
            while number == item.number {
                number = Int.random(in: ITEM_NUM_MIN...ITEN_NUM_MAX)
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
