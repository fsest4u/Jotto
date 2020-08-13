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
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    
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
        if typeGrade == .type_premium || typeGrade == .type_vip {
            viewPremium.isHidden = false
            initSlider(type: .type_low)
            initBtnLevel()
        }
        else {
            viewPremium.isHidden = true
        }

    }

    @IBAction func onClick_BtnGenerator(_ sender: UIButton) {
        sender.isSelected.toggle()
        drawLots(isCombine: sender.isSelected)
    }
    
    func resultLots(isFortune: Bool) {
        
        self.isFortune = isFortune

        DispatchQueue.main.sync {
//            spinner.stopAnimating()
            LoadingHUD.hide()

            if isFortune {
                imageViewClover.image = UIImage(named: "fortune")
                displayPopup(title: "안내", message: "오늘의 행운의 번호가 도착했습니다")
            }
            else {
                imageViewClover.image = UIImage(named: "happy")
            }
            tableView.reloadData()
        }

    }
    
    func drawLots(isCombine: Bool) {
                
        if isCombine {

            viewCover.isHidden = true
            tableView.isHidden = false
            viewInfo.isHidden = false
            viewBtn.backgroundColor = #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)
            
            btnLow.isEnabled = false
            btnMiddle.isEnabled = false
            btnHigh.isEnabled = false
            
//            spinner.startAnimating()
            LoadingHUD.show()
            if typeGrade == .type_vip {
                
                DispatchQueue.global().async {
                    for i in 0..<self.countRemain {
                        self.games = self.generator.getJottoGame()
                        let dateComponents = self.calculator.getFortuneDateComponent(grade: typeGrade)
                        let isFortune = self.calculator.isFortune(dateComponents: dateComponents)
                        let fortuneDate = self.calculator.getFortuneDate(dateComponents: dateComponents)
                        self.changeUI(date: fortuneDate, count: i)
                        if isFortune {
                            self.resultLots(isFortune: isFortune)
                            break
                        }
                    }
                }

            }
            else {

                countClick = countClick + 1
                DispatchQueue.global().async {
                    self.games = self.generator.getJottoGame()
                    let dateComponents = self.calculator.getFortuneDateComponent(grade: typeGrade)
                    let isFortune = self.calculator.isFortune(dateComponents: dateComponents)
                    let fortuneDate = self.calculator.getFortuneDate(dateComponents: dateComponents)
                    self.changeUI(date: fortuneDate, count: self.countClick)
                    self.resultLots(isFortune: isFortune)
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

//            sliderRemainCount.setValue(Float(countRemain), animated: true)
            generator.removeJottoGame()
        }
        
    }

    //MARK: Premium Function
    
    @IBAction func onClick_BtnLevelLow(_ sender: Any) {
        viewLevelLow.backgroundColor = #colorLiteral(red: 1, green: 0.4470588235, blue: 0.4470588235, alpha: 1)
        viewLevelMiddle.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        viewLevelHigh.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        initSlider(type: .type_low)

    }
    @IBAction func onClick_BtnLevelMiddle(_ sender: Any) {
        viewLevelLow.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        viewLevelMiddle.backgroundColor = #colorLiteral(red: 1, green: 0.4470588235, blue: 0.4470588235, alpha: 1)
        viewLevelHigh.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        initSlider(type: .type_middle)

    }
    @IBAction func onClick_BtnLevelHigh(_ sender: Any) {
        viewLevelLow.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        viewLevelMiddle.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        viewLevelHigh.backgroundColor = #colorLiteral(red: 1, green: 0.4470588235, blue: 0.4470588235, alpha: 1)
        initSlider(type: .type_high)

    }
    
    func initSlider(type: TYPE_DIFFICULTY) {
     
        countRemain = calculator.getRemainCount(difficulty: type)
        let maximum = Float(countRemain)
        print("initSlider: type \(type) max \(maximum)")
        sliderRemainCount.minimumValue = 0
        sliderRemainCount.maximumValue = maximum
        sliderRemainCount.setValue(Float(countRemain), animated: true)
        sliderRemainCount.setNeedsLayout()
        
        typeDifficulty = type

    }
    
    func changeUI(date: String, count: Int) {
        
        indexFortune = calculator.getFortuneIndex()

        var countClick = count
        if countRemain <= countClick {
            countClick = countRemain
        }
        let value = countRemain - countClick
        
        DispatchQueue.main.sync {
            self.imageViewClover.image = UIImage(named: "happy")
            self.labelDate.text = date
            print("date \(date) countRemain \(self.countRemain) countClick \(countClick) count \(value)")
            self.sliderRemainCount.setValue(Float(value), animated: true)
            tableView.reloadData()
            
        }
        
    }
    
    func initBtnLevel() {
        
        viewLevelLow.backgroundColor = #colorLiteral(red: 1, green: 0.4470588235, blue: 0.4470588235, alpha: 1)
        viewLevelMiddle.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        viewLevelHigh.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
     
    }
    
    func setBGColor(number: Int) -> UIColor {
        
        var color: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        if number < NUM_10 {
            color = #colorLiteral(red: 0.9921568627, green: 0.8039215686, blue: 0, alpha: 1)

        }
        else if number < NUM_20 {
            color = #colorLiteral(red: 0.4078431373, green: 0.7843137255, blue: 0.9490196078, alpha: 1)

        }
        else if number < NUM_30 {
            color = #colorLiteral(red: 1, green: 0.4470588235, blue: 0.4470588235, alpha: 1)

        }
        else if number < NUM_40 {
            color = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)

        }
        else if number < NUM_50 {
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
            print("games index \(index) game index \(i) number \(games[index].game[i].number)")
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

