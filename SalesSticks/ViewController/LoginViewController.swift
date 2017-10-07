//
//  LoginViewController.swift
//  SalesSticks
//
//  Created by Lohith K C on 10/2/17.
//  Copyright © 2017 Lohith K C. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class LoginViewController: UIViewController {

    @IBOutlet weak var line1View: UIView!
    @IBOutlet weak var line2View: UIView!
    
    @IBOutlet weak var loginButton: UIButton!

    @IBOutlet weak var usernameTextFeild: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextFeild: SkyFloatingLabelTextField!

    @IBOutlet weak var mainView: UIView!



    override func viewDidLoad() {
        super.viewDidLoad()

        configureLoginViewController()
        //To check Comit
        // Do any additional setup after loading the view.
    }

    
    func configureLoginViewController()  {
        
        StyleSheet.createGradientLayerForView(self.mainView, withColors: [UIColor.app_blue_1.cgColor, UIColor.app_blue_2.cgColor,UIColor.app_blue_3.cgColor])
        StyleSheet.customizeFloatingTextField(textFeild: usernameTextFeild, keyBoardType: .default, placeHolderString: "User Name")
        StyleSheet.customizeFloatingTextField(textFeild: passwordTextFeild, keyBoardType: .default, placeHolderString: "Password")
        StyleSheet.applyStyleAddTologinButton(button :loginButton)
//        self.view.s
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
