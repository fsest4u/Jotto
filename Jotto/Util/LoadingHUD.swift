//
//  LoadingHUD.swift
//  Jotto
//
//  Created by spdevapp on 2020/08/13.
//  Copyright © 2020 hyeon. All rights reserved.
//

import Foundation
import UIKit

class LoadingHUD: NSObject {
    
    private static let sharedInstance = LoadingHUD()
    private var popupView: UIImageView?
    
    class func show() {
        let popupView = UIImageView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        popupView.backgroundColor = .clear
        popupView.animationImages = LoadingHUD.getAnimationImageArray()
        popupView.animationDuration = 1.0
        popupView.animationRepeatCount = 0
        
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(popupView)
            popupView.center = window.center
            popupView.startAnimating()
            sharedInstance.popupView?.removeFromSuperview()
            sharedInstance.popupView = popupView
        }
    }
    
    class func hide() {
        if let popupView = sharedInstance.popupView {
            popupView.stopAnimating()
            popupView.removeFromSuperview()
        }
    }
    
    private class func getAnimationImageArray() -> [UIImage] {
        var animationArray: [UIImage] = []
        animationArray.append(UIImage(named: "loading00")!)
        animationArray.append(UIImage(named: "loading01")!)
        animationArray.append(UIImage(named: "loading02")!)
        animationArray.append(UIImage(named: "loading03")!)
        animationArray.append(UIImage(named: "loading04")!)
        animationArray.append(UIImage(named: "loading05")!)
        animationArray.append(UIImage(named: "loading06")!)
        animationArray.append(UIImage(named: "loading07")!)

        return animationArray
    }
}
