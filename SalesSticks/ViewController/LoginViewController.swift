//
//  LoginViewController.swift
//  SalesSticks
//
//  Created by Lohith K C on 10/2/17.
//  Copyright © 2017 Lohith K C. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var line1View: UIView!
    @IBOutlet weak var line2View: UIView!
    
    @IBOutlet weak var loginButton: UIButton!

    @IBOutlet weak var usernameTextFeild: UITextField!
    @IBOutlet weak var passwordTextFeild: UITextField!

    


    override func viewDidLoad() {
        super.viewDidLoad()

         StyleSheet.createGradientLayerForView(self.view, withColors: [UIColor.app_blue_1.cgColor, UIColor.app_blue_2.cgColor,UIColor.app_blue_3.cgColor])
        //To check Comit
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
