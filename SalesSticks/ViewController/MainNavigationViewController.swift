//
//  MainNavigationViewController.swift
//  SalesSticks
//
//  Created by Lohith K C on 10/2/17.
//  Copyright © 2017 Lohith K C. All rights reserved.
//

import UIKit
import Foundation

struct UserDefualtKeys {
    
    static let userNameKey = "USER_NAME"
    static let userphotoURL = "USER_PHOTO_URL"
    static let userTokenKey = "USER_TOKEN_KEY"
    static let userIDKey = "USER_ID_KEY"
    static let userTypeKey = "USER_TYPE_KEY"
    
}

class MainNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNamvigationControolerWithTitle()
        checkWhichScreenHasToOpen()
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkWhichScreenHasToOpen() {
        
        let token = UserDefaults.standard.object(forKey: UserDefualtKeys.userTokenKey)
        
        if (token as? NSString) != nil   {
            
            let rootViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarViewController")
            self.viewControllers = [rootViewController!]
           
            
        }
        else{
            let rootViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarViewController")
            
            self.viewControllers = [rootViewController!]
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
