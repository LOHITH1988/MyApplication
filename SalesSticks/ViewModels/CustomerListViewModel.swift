//
//  CustomerListViewModel.swift
//  SalesSticks
//
//  Created by Saneeb salam on 10/9/17.
//  Copyright © 2017 Lohith K C. All rights reserved.
//

import UIKit

class CustomerListViewModel: NSObject {

    @IBOutlet var appClient : APPClient!
    var customerModelList : [NSDictionary]?
    
    
    func getRouteModel(completion : @escaping () -> Void)  {
        
        guard  let token = UserDefaults.standard.object(forKey: UserDefualtKeys.userTokenKey) as? String else {
            return
        }
        
        let dataToSend = ["Token":token, "Date": getDate()] as AnyObject
        appClient.fetchDataFromServer(dataParaMeter: dataToSend, subUrl: deriveUrl.FetchRoute_URL, postType: postType, appiTypeCalled: typeOfApiCalled.routeApi) { (routeData) in
            
            DispatchQueue.main.async {
                
                if let model = routeData as? [NSDictionary]{
                    self.customerModelList = model
                    print(self.customerModelList!)
                    completion()
                }
                
            }
        }
    }
    
    func noOfRoutesToDisplay() -> Int {
      
        return customerModelList?.count ?? 0
    }
    func routeNameToDisplayfor(indexPath : IndexPath) -> String {
        
        return customerModelList?[indexPath.row].value(forKeyPath: "RouteName") as? String ?? ""
    }
    func addressDisplayfor(indexPath : IndexPath) -> String {
        return customerModelList?[indexPath.row].value(forKeyPath: "RouteArea") as? String ?? ""
    }
    
}