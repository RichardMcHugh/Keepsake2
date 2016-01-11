//
//  SecondViewController.swift
//  Keepsake
//
//  Created by Richard McHugh on 06/01/2016.
//  Copyright © 2016 Richard McHugh. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import Alamofire
import SwiftyJSON

class SecondViewController: UIViewController {
    
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(name)
        
        Alamofire.request(.GET, "http://midlandgates.co.uk/JSON/Keepsake-inputs.json").response { request, response, data, error in
        
            if let data = data {
        
                let json = JSON(data: data)
        
                for thing in json.arrayValue {
                    if thing["userName"].stringValue == self.name {
                        print("\(thing["text"].stringValue)")

                        
                        //textfield.text = thing["text"].stringValue
                        //Loading JSON Files
        
                    }
                }
                
            }
            
        }
        
        
    }
    
    
    @IBAction func dismiss(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}


