//
//  JottoTableCell.swift
//  Jotto
//
//  Created by spdevapp on 2020/07/27.
//  Copyright © 2020 hyeon. All rights reserved.
//

import Foundation
import UIKit

class JottoTableCell: UITableViewCell {
    
    @IBOutlet weak var viewCellBG: UIView!
    
    @IBOutlet weak var viewNum00: UIView! {
        
        didSet {
            viewNum00.layer.borderWidth = 0.5
            viewNum00.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
            viewNum00.layer.cornerRadius = (viewNum00.layer.frame.width - 6) / 2
        }
        
    }
    @IBOutlet weak var viewNum01: UIView! {
        
        didSet {
            viewNum01.layer.borderWidth = 0.5
            viewNum01.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
            viewNum01.layer.cornerRadius = (viewNum00.layer.frame.width - 6) / 2
        }
        
    }
    @IBOutlet weak var viewNum02: UIView! {
        
        didSet {
            viewNum02.layer.borderWidth = 0.5
            viewNum02.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
            viewNum02.layer.cornerRadius = (viewNum00.layer.frame.width - 6) / 2
        }
        
    }
    @IBOutlet weak var viewNum03: UIView! {
        
        didSet {
            viewNum03.layer.borderWidth = 0.5
            viewNum03.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
            viewNum03.layer.cornerRadius = (viewNum00.layer.frame.width - 6) / 2
        }
        
    }
    @IBOutlet weak var viewNum04: UIView! {
        
        didSet {
            viewNum04.layer.borderWidth = 0.5
            viewNum04.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
            viewNum04.layer.cornerRadius = (viewNum00.layer.frame.width - 6) / 2
        }
        
    }
    @IBOutlet weak var viewNum05: UIView! {
        
        didSet {
            viewNum05.layer.borderWidth = 0.5
            viewNum05.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
            viewNum05.layer.cornerRadius = (viewNum00.layer.frame.width - 6) / 2
        }
        
    }
    
    @IBOutlet weak var labelNum00: UILabel!
    @IBOutlet weak var labelNum01: UILabel!
    @IBOutlet weak var labelNum02: UILabel!
    @IBOutlet weak var labelNum03: UILabel!
    @IBOutlet weak var labelNum04: UILabel!
    @IBOutlet weak var labelNum05: UILabel!
    
    @IBOutlet weak var viewBG00: UIView!
    @IBOutlet weak var viewBG01: UIView!
    @IBOutlet weak var viewBG02: UIView!
    @IBOutlet weak var viewBG03: UIView!
    @IBOutlet weak var viewBG04: UIView!
    @IBOutlet weak var viewBG05: UIView!

    
    

}

