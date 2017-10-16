//
//  TodaysRouteViewController.swift
//  SalesSticks
//
//  Created by Saneeb salam on 10/5/17.
//  Copyright © 2017 Lohith K C. All rights reserved.
//

import UIKit

class TodaysRouteViewController: UIViewController {

    @IBOutlet var routeModel : RouteViewModel!
    @IBOutlet var logoImageView : UIImageView!
    @IBOutlet var employeeName : UILabel!
    @IBOutlet var employeeCompany : UILabel!

    
    @IBOutlet var displayTable : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         configureData()
        routeModel.getRouteModel {
            self.displayTable.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
    func configureData() {
       
        displayTable.rowHeight = UITableViewAutomaticDimension
        displayTable.estimatedRowHeight = 50
        StyleSheet.applyDataNameStyle(label : employeeName , size: 18.0)
        StyleSheet.applyshortLabelStyle(label : employeeCompany , size: 14.0)
        logoImageView.layer.cornerRadius = logoImageView.frame.width / 2.0
        logoImageView.layer.borderColor = UIColor.app_blue_1.cgColor
        logoImageView.layer.borderWidth = 1.0
        
       
        
        if  let name = UserDefaults.standard.object(forKey: UserDefualtKeys.userNameKey) as? String {
            employeeName.text = name
        }
        if  let companynName = UserDefaults.standard.object(forKey: UserDefualtKeys.companyName) as? String {
            employeeCompany.text = companynName
        }

        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        if self.navigationController != nil{
            self.navigationController!.configureNamvigationControolerWithTitle()
        }
        self.title = "Sales Sticks"
        
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

extension TodaysRouteViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
      let count = routeModel.noOfRoutesToDisplay()
        if count > 5{
            tableView.isScrollEnabled = true
        }
        else{
            tableView.isScrollEnabled = false
        }
      return  count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "RouteDisplayTableViewCell", for: indexPath) as? RouteDisplayTableViewCell
        cell?.routeLabel.text = routeModel.routeNameToDisplayfor(indexPath: indexPath)
        cell?.addressLabel.text = routeModel.addressDisplayfor(indexPath: indexPath)
        return cell!
    }
}

extension TodaysRouteViewController : UITableViewDelegate{
   
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
         tableView.deselectRow(at: indexPath, animated: true)
        
        let routeId = routeModel.getRouteId(indexPath: indexPath)
        
        let destViewController  = self.storyboard!.instantiateViewController(withIdentifier: "CoustomerListViewController") as? CoustomerListViewController
        destViewController?.routeId = routeId
        
        navigationController?.pushViewController(destViewController!, animated: true)
        

        
    }
}
