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

    @IBOutlet weak var topConstraints: NSLayoutConstraint!
   
    
    @IBOutlet weak var loginButton: UIButton!

    @IBOutlet weak var usernameTextFeild: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextFeild: SkyFloatingLabelTextField!

    @IBOutlet weak var mainView: UIImageView!



    override func viewDidLoad() {
        super.viewDidLoad()

        configureLoginViewController()
        //To check Comit
        // Do any additional setup after loading the view.
    }

    
    func configureLoginViewController()  {
        
       self.mainView.image = StyleSheet.getGrandientImage( withColors: [UIColor.app_blue_1.cgColor, UIColor.app_blue_2.cgColor,UIColor.app_blue_3.cgColor])
        StyleSheet.customizeFloatingTextField(textFeild: usernameTextFeild, keyBoardType: .default, placeHolderString: "User Name" , isEncripted : false , isAutoCorrection : .no)
        StyleSheet.customizeFloatingTextField(textFeild: passwordTextFeild, keyBoardType: .default, placeHolderString: "Password" , isEncripted : true , isAutoCorrection : .no)
        StyleSheet.applyStyleAddTologinButton(button :loginButton)
        usernameTextFeild.delegate = self
        passwordTextFeild.delegate = self

        let center = NotificationCenter.default
        center.addObserver(self,
                           selector: #selector(keyboardWillShow(_:)),
                           name: .UIKeyboardWillShow,
                           object: nil)
        
        center.addObserver(self,
                           selector: #selector(keyboardWillHide(_:)),
                           name: .UIKeyboardWillHide,
                           object: nil)
        
//        self.view.s
    }
    
    
    
    @objc func keyboardWillShow(_ noti: NSNotification)  {
        
       
            self.topConstraints.constant = -30
        
    }
    
    @objc func keyboardWillHide(_ noti: NSNotification)  {
        self.view.endEditing(true)
         self.topConstraints.constant = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
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

    @IBAction func  loginButtonPressed(_ sender : Any){
    
        if let data = checkAllDataisDer() {
            APPClient().loginUSerWithData(forCategory: data)
        }
        
    }
    
    func  checkAllDataisDer() -> AnyObject? {
        
        guard let name = usernameTextFeild.text, !name.isEmpty else {
            
            alertUser("Error", detailsText: "Please Enter the User Name", vc: self)
            return nil
        }
        
        guard let passWord = passwordTextFeild.text, !passWord.isEmpty else {
            
            alertUser("Error", detailsText: "Please Enter password, Password Should have minimum 6 charecters", vc: self)
            return nil
        }
        
        
        
        /*
         NSString *dataToPass =[NSString stringWithFormat:@"grant_type=password&username=%@&password=%@",[MyDelegate trimString:_userNameTextFeild.text],[MyDelegate trimString:_passwordTextFeild.text]];
         
         */
        
        let data = ["UserName" : name, "Password" : passWord]
        
        return data as AnyObject
    }
    
}
extension LoginViewController : UITextFieldDelegate{
    internal  func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        textField.resignFirstResponder()
        self.view.endEditing(true)
        
        return true
        
    }
}


