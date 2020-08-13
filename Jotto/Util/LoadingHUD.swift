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
        popupView.backgroundColor = UIColor.black
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
        animationArray.append(UIImage(named: "5-0")!)
        animationArray.append(UIImage(named: "5-1")!)
        animationArray.append(UIImage(named: "5-2")!)
        animationArray.append(UIImage(named: "5-3")!)
        animationArray.append(UIImage(named: "5-4")!)
        animationArray.append(UIImage(named: "5-5")!)
        animationArray.append(UIImage(named: "5-6")!)
        animationArray.append(UIImage(named: "5-7")!)
        
        return animationArray
    }
}
