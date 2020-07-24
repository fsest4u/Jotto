//
//  ViewController.swift
//  Jotto
//
//  Created by spdevapp on 2020/07/21.
//  Copyright © 2020 hyeon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var proc = Generator()
    var games: [JottoGame]?
    
    var indexFortune: Int = 0
    var isFortune: Bool = false
    
    @IBOutlet weak var viewCover: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewInfo: UIView!
    
    @IBOutlet weak var imageViewClover: UIImageView!
    @IBOutlet weak var labelDate: UILabel!
    
    var storedOffsets = [Int: CGFloat]()

    @IBOutlet weak var viewBtn: UIView! {
        
        didSet {
            viewBtn.layer.borderWidth = 0.5
            viewBtn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)
            viewBtn.layer.cornerRadius = 50
        }
        
    }
    
    @IBOutlet weak var btnCombine: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        proc.initItem(x: baseView.frame.origin.x, y: baseView.frame.origin.y, w: baseView.frame.width, h: baseView.bounds.height)
      
    }

    @IBAction func onClick_BtnGenerator(_ sender: UIButton) {
        sender.isSelected.toggle()
        changeViewBtn(isCombine: sender.isSelected)
    }
    
    func changeViewBtn(isCombine: Bool) {
        
        if isCombine {
            viewCover.isHidden = true
            tableView.isHidden = false
            viewInfo.isHidden = false
            viewBtn.backgroundColor = #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)
            games = proc.getJottoGame()
//            print("games: \(games)")
            isFortune = enableFortune()
            indexFortune = getFortuneIndex()
        }
        else {
            viewCover.isHidden = false
            tableView.isHidden = true
            viewInfo.isHidden = true
            viewBtn.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            proc.removeJottoGame()
        }
        
        tableView.reloadData()
    }
    
    func enableFortune() -> Bool {
        
        var curYear = getCurrentYear()

        var dateComponents = DateComponents()
        dateComponents.year = 2020//Int.random(in: 2000...curYear)
        dateComponents.month = Int.random(in: 1...12)
        dateComponents.day = Int.random(in: 1...31)
        
        guard let year = dateComponents.year, let month = dateComponents.month, let day = dateComponents.day else {
            return false
        }
        
        labelDate.text = "\(year)년 \(month)월 \(day)일"

        let randomDate: Date = Calendar.current.date(from: dateComponents) ?? Date()
        let isFortune = Calendar.current.isDateInToday(randomDate)
        print("isFortune : \(isFortune)")
        if isFortune {
            imageViewClover.image = UIImage(named: "fortune")
        }
        else {
            imageViewClover.image = UIImage(named: "happy")
        }
        return isFortune
    }

    func getFortuneIndex() -> Int {
        
        let index = CGFloat.random(in: 0...4)
        
        return Int(index)
    }
    
    func getCurrentYear() -> Int {
        
        let formatter_year = DateFormatter()
        formatter_year.dateFormat = "yyyy"
        let year = Int(formatter_year.string(from: Date())) ?? 2300

        return year
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let games = self.games else {
            return 0
        }
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let games = self.games else {
            return UITableViewCell()
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "JottoTableCell", for: indexPath) as! JottoTableCell
        let index = indexPath.row

        for i in 0...5 {
            let number = games[index].game[i].number
            let strNum = String(games[index].game[i].number)
            
            switch i {
                case 0:
                    cell.labelNum00.text = strNum
                    cell.viewNum00.backgroundColor = setBGColor(number: number)
                case 1:
                    cell.labelNum01.text = strNum
                    cell.viewNum01.backgroundColor = setBGColor(number: number)
                case 2:
                    cell.labelNum02.text = strNum
                    cell.viewNum02.backgroundColor = setBGColor(number: number)
                case 3:
                    cell.labelNum03.text = strNum
                    cell.viewNum03.backgroundColor = setBGColor(number: number)
                case 4:
                    cell.labelNum04.text = strNum
                    cell.viewNum04.backgroundColor = setBGColor(number: number)
                case 5:
                    cell.labelNum05.text = strNum
                    cell.viewNum05.backgroundColor = setBGColor(number: number)
                default:
                    cell.labelNum00.text = "-"
                    cell.viewNum00.backgroundColor = setBGColor(number: 1)
            }

        }
        
        print(isFortune, index == indexFortune)
        if isFortune, index == indexFortune {
            cell.viewCellBG.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.7607843137, blue: 0, alpha: 1)
        }
        else {
            cell.viewCellBG.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }

        
        return cell
    }
    
    
    func setBGColor(number: Int) -> UIColor {
        
        var color: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        if number < 10 {
            color = #colorLiteral(red: 0.9911321998, green: 0.8031750321, blue: 0, alpha: 0.8470588235)

        }
        else if number < 20 {
            color = #colorLiteral(red: 0.4078431373, green: 0.7843137255, blue: 0.9490196078, alpha: 1)

        }
        else if number < 30 {
            color = #colorLiteral(red: 1, green: 0.4470588235, blue: 0.4470588235, alpha: 1)

        }
        else if number < 40 {
            color = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)

        }
        else if number < 50 {
            color = #colorLiteral(red: 0.6901960784, green: 0.8431372549, blue: 0.2509803922, alpha: 1)

        }
        
        return color
    }
    
    
}

class JottoTableCell: UITableViewCell {
    
    @IBOutlet weak var viewCellBG: UIView!
    
    @IBOutlet weak var viewNum00: UIView! {
        
        didSet {
            viewNum00.layer.borderWidth = 0.5
            viewNum00.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)
            viewNum00.layer.cornerRadius = (viewNum00.layer.frame.width - 6) / 2
        }
        
    }
    @IBOutlet weak var viewNum01: UIView! {
        
        didSet {
            viewNum01.layer.borderWidth = 0.5
            viewNum01.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)
            viewNum01.layer.cornerRadius = (viewNum00.layer.frame.width - 6) / 2
        }
        
    }
    @IBOutlet weak var viewNum02: UIView! {
        
        didSet {
            viewNum02.layer.borderWidth = 0.5
            viewNum02.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)
            viewNum02.layer.cornerRadius = (viewNum00.layer.frame.width - 6) / 2
        }
        
    }
    @IBOutlet weak var viewNum03: UIView! {
        
        didSet {
            viewNum03.layer.borderWidth = 0.5
            viewNum03.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)
            viewNum03.layer.cornerRadius = (viewNum00.layer.frame.width - 6) / 2
        }
        
    }
    @IBOutlet weak var viewNum04: UIView! {
        
        didSet {
            viewNum04.layer.borderWidth = 0.5
            viewNum04.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)
            viewNum04.layer.cornerRadius = (viewNum00.layer.frame.width - 6) / 2
        }
        
    }
    @IBOutlet weak var viewNum05: UIView! {
        
        didSet {
            viewNum05.layer.borderWidth = 0.5
            viewNum05.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)
            viewNum05.layer.cornerRadius = (viewNum00.layer.frame.width - 6) / 2
        }
        
    }
    
    @IBOutlet weak var labelNum00: UILabel!
    @IBOutlet weak var labelNum01: UILabel!
    @IBOutlet weak var labelNum02: UILabel!
    @IBOutlet weak var labelNum03: UILabel!
    @IBOutlet weak var labelNum04: UILabel!
    @IBOutlet weak var labelNum05: UILabel!

}

