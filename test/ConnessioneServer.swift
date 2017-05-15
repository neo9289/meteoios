//
//  ConnessioneServer.swift
//  test
//
//  Created by Francesco Luise on 04/02/17.
//  Copyright © 2017 Francesco Luise. All rights reserved.
//

import UIKit
import Alamofire

class ConnessioneServer: NSObject {
    
    let Server = "api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}"

    
    func downloadPost() {
        
        let link = Server + "/posts/1"
        
        Alamofire.request(link).responseJSON{ response in
            print(response.request!)
            print(response.response!)
            print(response.data!)
            print(response.result)
            
            if let JSON = response.result.value{
                print("json: \(JSON)")
            }
        }

    }

}
