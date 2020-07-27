//
//  ViewController.swift
//  Jotto
//
//  Created by spdevapp on 2020/07/21.
//  Copyright © 2020 hyeon. All rights reserved.
//

import UIKit
import PopupDialog

class ViewController: UIViewController {

    var generator = GeneratorNumber()
    var calculator = CalculatorDate()

    var games: [JottoGame]?
    
    var indexFortune: Int = 0
    var isFortune: Bool = false
    
    @IBOutlet weak var viewCover: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewInfo: UIView!
    
    @IBOutlet weak var imageViewClover: UIImageView!
    @IBOutlet weak var labelDate: UILabel!
    
    @IBOutlet weak var sliderRemainCount: UISlider!
    
    @IBOutlet weak var viewBtn: UIView! {
        
        didSet {
            viewBtn.layer.borderWidth = 0.5
            viewBtn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)
            viewBtn.layer.cornerRadius = (viewBtn.frame.width / 2)
        }
        
    }
    
    @IBOutlet weak var btnCombine: UIButton!
    
    
    //MARK: Premium & Vip Variable
    
    var countClick = 0
    var countRemain = 0

    @IBOutlet weak var viewPremium: UIView!
    @IBOutlet weak var viewLevelLow: UIView! {
        
        didSet {
            viewLevelLow.layer.borderWidth = 0.5
            viewLevelLow.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)
            viewLevelLow.layer.cornerRadius = viewLevelLow.frame.height / 2
        }
        
    }
    @IBOutlet weak var viewLevelMiddle: UIView! {
        
        didSet {
            viewLevelMiddle.layer.borderWidth = 0.5
            viewLevelMiddle.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)
            viewLevelMiddle.layer.cornerRadius = viewLevelMiddle.frame.height / 2
        }
        
    }
    @IBOutlet weak var viewLevelHigh: UIView! {
        
        didSet {
            viewLevelHigh.layer.borderWidth = 0.5
            viewLevelHigh.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)
            viewLevelHigh.layer.cornerRadius = viewLevelHigh.frame.height / 2
        }
        
    }
    
    @IBOutlet weak var btnLow: UIButton!
    @IBOutlet weak var btnMiddle: UIButton!
    @IBOutlet weak var btnHigh: UIButton!
    

    //MARK: General Function
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewCover.isHidden = false
        if typeGrade == TYPE_GRADE.type_premium || typeGrade == TYPE_GRADE.type_vip {
            viewPremium.isHidden = false
            typeDiff = TYPE_DIFFICULTY.type_low
            initSlider()
            initBtnLevel()
        }
        else {
            viewPremium.isHidden = true
        }

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
            
            btnLow.isEnabled = false
            btnMiddle.isEnabled = false
            btnHigh.isEnabled = false

            countClick = countClick + 1
            if countRemain <= countClick {
                countClick = 1
            }
            var temp = countRemain - countClick
            print("count: \(temp)")
            sliderRemainCount.setValue(Float(temp), animated: true)
//            sliderRemainCount.layoutIfNeeded()
     
            games = generator.getJottoGame()
//            print("games: \(games)")
            let dateComponents = calculator.getFortuneDateComponent(typeGrade: typeGrade)
            labelDate.text = calculator.getFortuneDate(dateComponents: dateComponents)
            print("날짜 : \(labelDate.text)")
            isFortune = calculator.isFortune(dateComponents: dateComponents)
            if isFortune {
                imageViewClover.image = UIImage(named: "fortune")
                indexFortune = calculator.getFortuneIndex()
                displayPopup(title: "안내", message: "오늘의 행운의 번호가 도착했습니다")
            }
            else {
                if typeGrade == TYPE_GRADE.type_vip {
                    changeViewBtn(isCombine: isCombine)
                }
                else {
                    imageViewClover.image = UIImage(named: "happy")
                }
            }

        }
        else {
            viewCover.isHidden = false
            tableView.isHidden = true
            viewInfo.isHidden = true
            viewBtn.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            
            btnLow.isEnabled = true
            btnMiddle.isEnabled = true
            btnHigh.isEnabled = true

//            sliderRemainCount.setValue(0, animated: true)
            generator.removeJottoGame()
        }
        
        tableView.reloadData()
    }

    //MARK: Premium Function
    
    @IBAction func onClick_BtnLevelLow(_ sender: Any) {
        viewLevelLow.backgroundColor = #colorLiteral(red: 1, green: 0.4470588235, blue: 0.4470588235, alpha: 1)
        viewLevelMiddle.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        viewLevelHigh.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        typeDiff = TYPE_DIFFICULTY.type_low
        initSlider()
        
    }
    @IBAction func onClick_BtnLevelMiddle(_ sender: Any) {
        viewLevelLow.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        viewLevelMiddle.backgroundColor = #colorLiteral(red: 1, green: 0.4470588235, blue: 0.4470588235, alpha: 1)
        viewLevelHigh.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        typeDiff = TYPE_DIFFICULTY.type_middle
        initSlider()

    }
    @IBAction func onClick_BtnLevelHigh(_ sender: Any) {
        viewLevelLow.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        viewLevelMiddle.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        viewLevelHigh.backgroundColor = #colorLiteral(red: 1, green: 0.4470588235, blue: 0.4470588235, alpha: 1)
        typeDiff = TYPE_DIFFICULTY.type_high
        initSlider()

    }
    
    func initSlider() {
     
        countRemain = calculator.getRemainCount(type: typeDiff)
        let maximum = Float(countRemain)
        print("initSlider: \(maximum)")
        sliderRemainCount.setValue(0, animated: true)
        sliderRemainCount.setNeedsLayout()
        sliderRemainCount.minimumValue = 1
        sliderRemainCount.maximumValue = maximum
    }
    
    func initBtnLevel() {
        
        viewLevelLow.backgroundColor = #colorLiteral(red: 1, green: 0.4470588235, blue: 0.4470588235, alpha: 1)
        viewLevelMiddle.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        viewLevelHigh.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
     
    }
    
    func setBGColor(number: Int) -> UIColor {
        
        var color: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        if number < 10 {
            color = #colorLiteral(red: 0.9921568627, green: 0.8039215686, blue: 0, alpha: 1)

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
    
    func displayPopup(title: String, message: String) {
        
        let popup = PopupDialog(title: title, message: message)
        let btnOK = DefaultButton(title: "OK", action: nil)
        
        self.present(popup, animated: true, completion: nil)
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
        let bgColor: UIColor
        if isFortune, index == indexFortune {
            bgColor = #colorLiteral(red: 0.9882352941, green: 0.7607843137, blue: 0, alpha: 1)
            cell.viewBG00.backgroundColor = bgColor
            cell.viewBG01.backgroundColor = bgColor
            cell.viewBG02.backgroundColor = bgColor
            cell.viewBG03.backgroundColor = bgColor
            cell.viewBG04.backgroundColor = bgColor
            cell.viewBG05.backgroundColor = bgColor

        }
        else {
            bgColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            cell.viewBG00.backgroundColor = bgColor
            cell.viewBG01.backgroundColor = bgColor
            cell.viewBG02.backgroundColor = bgColor
            cell.viewBG03.backgroundColor = bgColor
            cell.viewBG04.backgroundColor = bgColor
            cell.viewBG05.backgroundColor = bgColor
        }

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

        return cell
    }
    
}

