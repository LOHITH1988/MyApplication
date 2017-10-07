//
//  UIFont+App.swift
//  SalesSticks
//
//  Created by Saneeb salam on 10/7/17.
//  Copyright © 2017 Lohith K C. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    class func boldAppFontOfSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "ArialRoundedMTBold", size: size)!
    }
    
    class func regularAppFontOfSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue", size: size)!
    }
    
    class func boldAppFontOfSize1(_ size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Bold", size: size)!
    }
    
    class func boldAppFontOfSize2(_ size: CGFloat) -> UIFont {
        return UIFont(name: "ArialRoundedMTBold", size: size)!
    }
}

