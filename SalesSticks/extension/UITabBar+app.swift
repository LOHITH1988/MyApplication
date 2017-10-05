//
//  UITabBar+app.swift
//  SalesSticks
//
//  Created by Saneeb salam on 10/5/17.
//  Copyright © 2017 Lohith K C. All rights reserved.
//

import Foundation
import UIKit

extension UITabBar {
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 60
        return sizeThatFits
    }
}
