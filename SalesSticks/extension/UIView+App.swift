//
//  UIView+App.swift
//  SalesSticks
//
//  Created by Saneeb salam on 10/7/17.
//  Copyright © 2017 Lohith K C. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    class func viewFromNibName(_ name: String) -> UIView? {
        let views = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        return views?.first as? UIView
    }
    class func topViewController() -> UIViewController?{
        
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            return topController
            // topController should now be your topmost view controller
        }
        return nil
    }
}


