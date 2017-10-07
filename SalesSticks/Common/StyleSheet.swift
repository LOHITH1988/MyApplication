//
//  StyleSheet.swift
//  SalesSticks
//
//  Created by Saneeb salam on 10/7/17.
//  Copyright © 2017 Lohith K C. All rights reserved.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField

let interfaceSize = CGSize(width: 414, height: 736)

let StyleSheetApplicationFontSize1 = CGFloat(11.0)
let StyleSheetApplicationFontSize2 = CGFloat(12.0)
let StyleSheetApplicationFontSize3 = CGFloat(13.0)
let StyleSheetApplicationFontSize4 = CGFloat(14.0)
let StyleSheetApplicationFontSize5 = CGFloat(15.0)
let StyleSheetApplicationFontSize6 = CGFloat(16.0)
let StyleSheetApplicationFontSize7 = CGFloat(17.0)
let StyleSheetApplicationFontSize8 = CGFloat(24.0)
let StyleSheetApplicationFontSize9 = CGFloat(40.0)
let StyleSheetApplicationFontSize10 = CGFloat(19.0)
let StyleSheetApplicationFontSize11 = CGFloat(20.0)
let StyleSheetApplicationFontSize12 = CGFloat(23.0)

let StyleSheetDefaultSeparatorHeight = CGFloat(0.5)
let StyleSheetDefaultCornerRadius = CGFloat(14.0)
let StyleSheetDefaultBorderLineWidth = CGFloat(1.0)

let StyleSheetDefaultCellPaddingFactor = 10 / interfaceSize.width
let StyleSheetDrilldownCellPaddingFactor = 20 / interfaceSize.width



final class StyleSheet
{
    
    
    
    
    class func applyPriceLabelStyle(label : UILabel , size: CGFloat ) {
        label.font = UIFont.boldAppFontOfSize1(size)
        label.textColor = UIColor.app_black
    }
    
    class func applyPrductDiscriptionStyle(label : UILabel , size: CGFloat) {
        label.font = UIFont.regularAppFontOfSize(size)
        label.textColor = UIColor.darkGray
    }
    class func applyPrductNameStyle(label : UILabel , size: CGFloat) {
        label.font = UIFont.regularAppFontOfSize(size)
        label.textColor = UIColor.darkGray
    }
    class func applyNavigationBarColor (navigationBar :UINavigationBar) {
        
        navigationBar.barTintColor = UIColor.app_offWhite
        navigationBar.tintColor = UIColor.app_black
        navigationBar.barStyle = .default
        
    }
    class func applySelectedSizeButton (button :UIButton) {
        
        button.setTitleColor(UIColor.darkGray, for: .normal)
        
        
    }
    class func applyStyleAddTologinButton(button :UIButton) {
        
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 12
        button.layer.borderColor = UIColor.app_blue_3.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Log in", for: .normal)
    }
    
    
    class func customizeFloatingTextField (textFeild :SkyFloatingLabelTextField, keyBoardType : UIKeyboardType , placeHolderString : String){
        
        
        textFeild.font =  UIFont.regularAppFontOfSize(StyleSheetApplicationFontSize6)
        textFeild.placeholderFont = UIFont.italicSystemFont(ofSize: StyleSheetApplicationFontSize6)
        textFeild.errorColor = UIColor.red
        textFeild.textColor = UIColor.white
        textFeild.selectedLineColor = UIColor.white
        textFeild.lineColor =  UIColor.white
        textFeild.titleColor = UIColor.app_blue_2
        textFeild.selectedTitleColor =  UIColor.app_blue_2
        textFeild.placeholder = placeHolderString
        textFeild.keyboardType = keyBoardType
    }
    class func createGradientLayerForView(_ view: UIView , withColors colors: [CGColor]) {
        
       let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = view.bounds
        
        gradientLayer.colors = colors
        
        view.layer.addSublayer(gradientLayer)
        view.layer.zPosition = 1
    }
}

