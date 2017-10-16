//
//  CoustomerListViewController.swift
//  SalesSticks
//
//  Created by Saneeb salam on 10/10/17.
//  Copyright © 2017 Lohith K C. All rights reserved.
//

import UIKit

class CoustomerListViewController: UIViewController {

    @IBOutlet var coustomersModel : CustomerListViewModel!
    @IBOutlet var displayTable : UITableView!

    var routeId : String!
    override func viewDidLoad() {
        super.viewDidLoad()

        coustomersModel.getCustomerModelListForRoute(route: routeId) {
            self.displayTable.reloadData()
        }
        // Do any additional setup after loading the view.
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
 // MARK: - tableView Delegates

extension CoustomerListViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        let count = coustomersModel.noOfCustomersToDisplay()
        
        return  count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RouteDisplayTableViewCell", for: indexPath) as? RouteDisplayTableViewCell
        cell?.routeLabel.text = coustomersModel.routeNameToDisplayfor(indexPath: indexPath)
        cell?.addressLabel.text = coustomersModel.addressDisplayfor(indexPath: indexPath)
        return cell!
    }
}
