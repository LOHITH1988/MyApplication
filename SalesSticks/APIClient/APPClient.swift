//
//  APPClient.swift
//  SalesSticks
//
//  Created by Saneeb salam on 10/8/17.
//  Copyright © 2017 Lohith K C. All rights reserved.
//

import UIKit
import PKHUD

 let postType = "POST"
 let getType = "GET"

struct typeOfApiCalled{
    
    static let routeApi = "RouteAPICalled"
    static let customerApi = "CustomersInRouteAPICalled"

}

class APPClient: NSObject {

   
    
    func loginUSerWithData(forCategory:AnyObject) {
   
        guard let request = getUrlRequestFromURLSubUrlOnDataWithType(baseURL,deriveUrl.Login_URL,forCategory,postType) else{
            return
        }
        
        let session = URLSession.shared
        
        appDelegate.showHUD()
        let task  = session.dataTask(with: request , completionHandler: {data, response, error -> Void in
           
            DispatchQueue.main.async {
              appDelegate.hideHUD()
              
                guard let unwarped = data else{
                    return
                }
                
                do{
                    if let responceData = try JSONSerialization.jsonObject(with: unwarped, options: .allowFragments) as? NSDictionary{
                       
                        print(responceData)
                        
                        if let userToken = responceData.object(forKey: "Token") as? String {
                            
                            if let userName = responceData.object(forKey: "DisplayName") as? String {
                                if let Id = responceData.object(forKey: "Id")  {
                                UserDefaults.standard.set(userToken, forKey: UserDefualtKeys.userTokenKey)
                                UserDefaults.standard.set(userName, forKey: UserDefualtKeys.userNameKey)
                                     UserDefaults.standard.set(Id, forKey: UserDefualtKeys.userIDKey)
                                    
                                    reloadViews(UIView.topViewController()!)
                                    return
                                }
                            }
                        }
                        
                        
                    }
                
                }catch{
                    
                    alertUser("Error", detailsText: "There is some error", vc: UIView.topViewController()!)
//                    completion(nil)
                }
                
            }
            
            
        })
        
        task.resume()
        
        
    }
    
    
    func fetchDataFromServer(dataParaMeter: AnyObject, subUrl: String , postType : String , appiTypeCalled: String , completion:@escaping BlockResponder) {
        
//        guard  let token = UserDefaults.standard.object(forKey: UserDefualtKeys.userTokenKey) as? String else {
//            return
//        }
        
//        let dataToSend = ["Token":token, "Date": getDate()] as AnyObject
        
        guard let request = getUrlRequestFromURLSubUrlOnDataWithType(baseURL,subUrl,dataParaMeter ,postType) else{
            return
        }
        
        let session = URLSession.shared
        
        appDelegate.showHUD()
        let task  = session.dataTask(with: request , completionHandler: {data, response, error -> Void in
            
            DispatchQueue.main.async {
                appDelegate.hideHUD()
                
                guard let unwarped = data else{
                    return
                }
                
                do{
                    if let responceData = try JSONSerialization.jsonObject(with: unwarped, options: .allowFragments) as? NSDictionary{
                        
                        print(responceData)
                        
                     
                        if let dataArray = responceData.object(forKey: "List") as? [NSDictionary]
                        {
                           completion(dataArray as AnyObject)
                        }
                        else{
                            completion(nil)
                        }
                        
                    }
                    
                }catch{
                    
                    alertUser("Error", detailsText: "There is some error", vc: UIView.topViewController()!)
                                        completion(nil)
                }
                
            }
            
            
        })
        
        task.resume()
        
        
    }
    
    
    
    private func getUrlRequestFromURLSubUrlOnDataWithType(_ baseUrlString: String, _ subURL: String, _ onArray: AnyObject, _ onType : String) -> URLRequest?{
        
        let  url = "\(baseUrlString)\(subURL)"
        let encodedHost = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let requestString  = encodedHost! as NSString
        let request = NSMutableURLRequest(url: NSURL(string: requestString as String)! as URL)
        request.httpMethod = onType
        request.httpBody = try? JSONSerialization.data(withJSONObject: onArray, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        return request as URLRequest
    }
    
    
}




/*
{
    
    //        if let reqId = datarry?.object(forKey: "RequestID") as? String{
    
    //            if let Id = datarry?.object(forKey: "ID") as? Int{
    if let price = dataArray?.object(at: selectedIndex) as? NSDictionary{
        
        
        
        
        let token = UserDefaults.standard.object(forKey: Constant.UserDefualtKeys.userTokenKey)
        
        if let userName = token as? NSString   {
            
            let tokenStrng = "bearer \(userName)"
            var lang = "1"
            if L102Language.currentAppleLanguage() == "ar" {
                lang = "2"
            }
            
            let amount = price.object(forKey: "Text") as? String
            
            let dataToSend = ["amount": amount!, "LanID": lang] as [String : Any]
            
            let  url = "\(BaseUrl)\(subUrls.refilAmountURL)"
            let encodedHost = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            
            let requestString  = encodedHost! as NSString
            
            HUD.show(.rotatingImage(UIImage(named: "progress")))
            
            let request = NSMutableURLRequest(url: NSURL(string: requestString as String)! as URL)
            let session = URLSession.shared
            request.httpMethod = "POST"
            
            
            request.httpBody = try? JSONSerialization.data(withJSONObject: dataToSend, options: [])
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue(tokenStrng, forHTTPHeaderField: "Authorization")
            
            let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
                DispatchQueue.main.async {
                    HUD.hide(animated: true, completion: nil)
                    
                    if (error != nil) {
                        
                        alertUser("Error", detailsText: "Please check your connection and try again later", vc:self)
                        
                    } else {
                        
                        
                        do {
                            
                            let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
                            
                            print(parsedData)
                            
                            if let sucesse = parsedData.object(forKey: "IsOk") as? Bool{
                                if sucesse{
                                    
                                    if let url = parsedData.object(forKey: "PageURL") as? String{
                                        
                                        self.callWebUrl (url,  redirectURl: " ")
                                        
                                    }
                                    //                                            let vc  = self.storyboard!.instantiateViewController(withIdentifier: "VerifyPaymentForWalletRefilOrMobileViewController") as? VerifyPaymentForWalletRefilOrMobileViewController
                                    //
                                    //                                            vc?.type = refill
                                    //                                            vc?.data = parsedData
                                    //                                            self.title = ""
                                    //                                            self.navigationController?.pushViewController(vc!, animated: true)
                                    
                                    
                                    
                                    
                                    
                                    
                                }
                                else{
                                    
                                    if let message = parsedData.object(forKey: "Message") as? String{
                                        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertControllerStyle.alert)
                                        
                                        alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
                                            
                                            
                                        })
                                        self.present(alert, animated: true, completion: nil)
                                        
                                    }
                                    
                                }
                            }
                            else{
                                
                            }
                            print(parsedData)
                        } catch let error as NSError {
                            print(error)
                        }
                        
                    }
                }
                
                
                
            })
            
            task.resume()
            
        }
    }
    //        }
}
 */
