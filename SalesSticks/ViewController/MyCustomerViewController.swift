//
//  MyCustomerViewController.swift
//  SalesSticks
//
//  Created by Saneeb salam on 10/5/17.
//  Copyright © 2017 Lohith K C. All rights reserved.
//

import UIKit

class MyCustomerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        if self.navigationController != nil{
            self.navigationController!.configureNamvigationControolerWithTitle()
            
        }
        
        self.title = "My Customers"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
