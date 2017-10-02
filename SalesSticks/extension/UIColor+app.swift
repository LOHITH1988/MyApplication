//
//  UIColor+app.swift
//  SalesSticks
//
//  Created by Lohith K C on 10/2/17.
//  Copyright © 2017 Lohith K C. All rights reserved.
//

import Foundation
import UIKit


extension UIColor
{
    class var app_blue: UIColor {
        return UIColor(RGBHex:0x3C1D72)
    }
    
    class var app_navigationBarColor: UIColor {
        return UIColor(RGBHex:0x283174)
    }
    
    class var app_black: UIColor {
        return UIColor(RGBHex:0x313132)
    }
    
    class var app_lightGray: UIColor {
        return UIColor(RGBHex:0x77858E)
    }
    
    class var app_offWhite: UIColor {
        return UIColor(RGBHex: 0xf7fbfb)
    }
    
    
    
    
    
    
}

extension UIColor
{
    
    convenience init(RGBHex: UInt32) {
        self.init(red: CGFloat((RGBHex >> 16) & 0xff)/255.0, green: CGFloat((RGBHex >> 8) & 0xff)/255.0, blue: CGFloat(RGBHex & 0xff)/255.0, alpha: CGFloat(1.0))
    }
    
    convenience init(RGBAHex: UInt32) {
        self.init(red: CGFloat((RGBAHex >> 24) & 0xff)/255.0, green: CGFloat((RGBAHex >> 16) & 0xff)/255.0, blue: CGFloat((RGBAHex >> 8) & 0xff)/255.0, alpha: CGFloat(RGBAHex & 0xff)/255.0)
    }
    
    convenience init(ARGBHex: UInt32) {
        self.init(red: CGFloat((ARGBHex >> 16) & 0xff)/255.0, green: CGFloat((ARGBHex >> 8) & 0xff)/255.0, blue: CGFloat(ARGBHex & 0xff)/255.0, alpha: CGFloat((ARGBHex >> 24) & 0xff)/255.0)
    }
    
    convenience init?(ARGBString : String) {
        var colorStringValue: String = ARGBString.trimmingCharacters(in: (NSCharacterSet.whitespacesAndNewlines) as CharacterSet).uppercased()
        //        var colorStringValue: String = ARGBString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercased()
        if (colorStringValue.hasPrefix("#")) {
            colorStringValue = colorStringValue.substring(from: colorStringValue.characters.index(colorStringValue.startIndex, offsetBy: 1))
        }
        var colorHexValue : UInt32 = 0
        Scanner(string: colorStringValue).scanHexInt32(&colorHexValue)
        self.init(ARGBHex: colorHexValue)
    }
    
    public func hexString(_ includeAlpha: Bool) -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        if (includeAlpha) {
            return String(format: "#%02X%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255), Int(a * 255))
        } else {
            return String(format: "#%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
        }
    }
}

