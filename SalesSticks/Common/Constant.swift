//
//  Constant.swift
//  SalesSticks
//
//  Created by Saneeb salam on 10/7/17.
//  Copyright © 2017 Lohith K C. All rights reserved.
//

import Foundation
import UIKit

typealias BlockResponder = (_ response: AnyObject?) -> Void

let baseURL = "http://app.salessticks.com/service/"
let ProductDetailsURL = "lks.json"

struct UserDefualtKeys {
    
    static let userNameKey = "USER_NAME"
    static let userphotoURL = "USER_PHOTO_URL"
    static let userTokenKey = "USER_TOKEN_KEY"
    static let userIDKey = "USER_ID_KEY"
    static let userTypeKey = "USER_TYPE_KEY"
    static let companyName = "USER_Company_Name"

}


struct deriveUrl {
    static let Login_URL = "api/Employee/login"
    static let FetchRoute_URL = "api/Route/GetSalePersonRouteByDate"
    static let FetchCoustomers_From_Route_URL = "api/Customer/getcustomerbyrouteid"

}

func alertUser(_ title : String , detailsText : String , vc : UIViewController){
    
    let alert = UIAlertController(title: title, message: detailsText, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
    vc.present(alert, animated: true, completion: nil)
    
}
func reloadViews(_ view : UIViewController){
    

    let rootviewcontroller: UIWindow = ((UIApplication.shared.delegate?.window)!)!
    rootviewcontroller.rootViewController = view.storyboard?.instantiateViewController(withIdentifier: "MainNavigationViewController")
    let mainwindow = (UIApplication.shared.delegate?.window!)!
    mainwindow.backgroundColor = UIColor(hue: 0.6477, saturation: 0.6314, brightness: 0.6077, alpha: 0.8)
    UIView.transition(with: mainwindow, duration: 0.55001, options: [], animations: { () -> Void in
    }) { (finished) -> Void in
        
    }
    
}

func getDate()->String{
    
    let formatter = DateFormatter()
    // initially set the format based on your datepicker date
    formatter.dateFormat = "yyyy-MM-dd"
    
    let myString = formatter.string(from: Date())
    
//    return myString
    return "2017-10-09"
}
