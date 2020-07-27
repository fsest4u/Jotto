//
//  Constant.swift
//  Jotto
//
//  Created by spdevapp on 2020/07/22.
//  Copyright © 2020 hyeon. All rights reserved.
//

import Foundation
import UIKit

//let ITEM_KEY_LOTTO_NUMBER = "number"
//let ITEM_KEY_POSX = "posx"
//let ITEM_KEY_POSY = "posy"
//let ITEM_KEY_FONT_COLOR = "color"
//let ITEM_KEY_FONT_SIZE = "size"
//
//let HEIGHT_ROW: CGFloat = 160
//let GAP_CELL: CGFloat = 5
//
//let minFontSize: CGFloat = 40
//let maxFontSize: CGFloat = 60

var DATE_LAST_DAY = 31
let DATE_LAST_MONTH = 12
let DATE_LAST_YEAR = 2029
let DATE_ALL = 365

let NUM_10 = 10
let NUM_20 = 20
let NUM_30 = 30
let NUM_40 = 40
let NUM_50 = 50

let ITEM_NUM_MIN = 1
let ITEN_NUM_MAX = 45
let ITEM_NUM_CNT = 6
let GAME_NUM_CNT = 5

enum TYPE_DIFFICULTY {
    case type_low
    case type_middle
    case type_high
}
var typeDiff: TYPE_DIFFICULTY = TYPE_DIFFICULTY.type_low

enum TYPE_GRADE {
    case type_normal        // 난이도 선택 안됨, 현재 진행상태 못봄 (default)
    case type_premium       // 난이도 선택, 현재 진행상태
    case type_vip           // 행운번호 뽑힐 때까지
}
var typeGrade: TYPE_GRADE = TYPE_GRADE.type_normal
