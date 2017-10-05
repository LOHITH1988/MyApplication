//
//  UINavigationViewController+app.swift
//  SalesSticks
//
//  Created by Saneeb salam on 10/5/17.
//  Copyright © 2017 Lohith K C. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController{
   
    public func configureNamvigationControolerWithTitle(){
        
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        
    }
}
