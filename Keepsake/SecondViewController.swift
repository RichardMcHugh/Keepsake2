//
//  SecondViewController.swift
//  Keepsake
//
//  Created by Richard McHugh on 06/01/2016.
//  Copyright © 2016 Richard McHugh. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBAction func goToFirst() {
        let alertController: UIAlertController = UIAlertController(title: "Save and quit", message: "Back to Map?", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel?", style: .Cancel) { action-> Void in
            //
        }
        
        let nextAction = UIAlertAction(title: "Download", style: .Default) { (action) -> Void in
            self.performSegueWithIdentifier("toFirst", sender: self)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(nextAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }




}
