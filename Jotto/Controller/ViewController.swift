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
    
    var index: Int = 0
    let height: CGFloat = 160
    let cellGap: CGFloat = 5

    
    @IBOutlet weak var tableView: UITableView!
    
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
        print("onClick_BtnGenerator")
        sender.isSelected.toggle()
        
        changeViewBtn(isCombine: sender.isSelected)

    }
    
    func changeViewBtn(isCombine: Bool) {
        
        if isCombine {
            tableView.isHidden = false
            viewBtn.backgroundColor = #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)
            games = proc.getJottoGame()
//            print("games: \(games)")
        }
        else {
            tableView.isHidden = true
            viewBtn.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            proc.removeJottoGame()
            index = 0
        }
        
        tableView.reloadData()
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "JottoTableCell", for: indexPath) as! JottoTableCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "JottoTableCell", for: indexPath) as! JottoTableCell

        print("0 - \(indexPath.row)")
        cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
        cell.collJottoOffset = storedOffsets[indexPath.row] ?? 0
        index = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
                let cell = tableView.dequeueReusableCell(withIdentifier: "JottoTableCell", for: indexPath) as! JottoTableCell
        
        storedOffsets[indexPath.row] = cell.collJottoOffset
    }
    
}

class JottoTableCell: UITableViewCell {
    
    @IBOutlet weak var collJotto: UICollectionView!

    var collJottoOffset: CGFloat {
        get {
            return collJotto.contentOffset.x
        }
        
        set {
            collJotto.contentOffset.x = newValue
        }
    }

    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
//        collJotto.delegate = dataSourceDelegate
//        collJotto.dataSource = dataSourceDelegate
        collJotto.tag = row
        collJotto.reloadData()
        print("1 - \(collJotto.tag)")
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let games = self.games else {
            return 0
        }
        return games[collectionView.tag].game.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JottoCollectionCell", for: indexPath) as! JottoCollectionCell
        
        guard let games = self.games else {
            return UICollectionViewCell()
        }
        // temp_code, dylee tag -> index
//        let tag = collectionView.tag
        let number = games[index].game[indexPath.row].number
        let strNum = String(games[index].game[indexPath.row].number)
        cell.labelJotto.text = strNum
        
        cell.viewJotto.clipsToBounds = true
        cell.viewJotto.backgroundColor = setBGColor(number: number)
        print("viewJotto : \(cell.frame.width)")
        cell.viewJotto.layer.cornerRadius = (cell.frame.width / 2)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        print("width - \(self.tableView.frame.width)")
        print("width - \(collectionView.frame.width)")
        let width = collectionView.frame.width / 6 - 1
        print("width - \(width)")
        return CGSize(width: width, height: width)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return cellGap
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return cellGap
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

class JottoCollectionCell: UICollectionViewCell {
    
    
    @IBOutlet weak var viewJotto: UIView!
    @IBOutlet weak var labelJotto: UILabel!
    
    
}
