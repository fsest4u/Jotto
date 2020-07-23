//
//  Extension.swift
//  Jotto
//
//  Created by spdevapp on 2020/07/22.
//  Copyright © 2020 hyeon. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func replace(target: String, withString: String) -> String {
        
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
        
    }
}

extension UIColor {

    class func StringFromUIColor(color: UIColor) -> String? {
        let components: [CGFloat] = color.cgColor.components!
        if components.count == 4 {
            return "[\(components[0]),\(components[1]),\(components[2]),\(components[3])]"
        }
        else {
            return nil
        }
    }
    
    class func UIColorFromString(string: String) -> UIColor? {
        if string.isEmpty {
            return nil
        }
        else {
            let componentsString = string.replace(target: "[", withString: "").replace(target: "]", withString: "")
            let components = componentsString.split(separator: ",")
            return UIColor(red: CGFloat((components[0] as NSString).floatValue),
                           green: CGFloat((components[1] as NSString).floatValue),
                           blue: CGFloat((components[2] as NSString).floatValue),
                           alpha: CGFloat((components[3] as NSString).floatValue))
        }
       
    }
    
}
