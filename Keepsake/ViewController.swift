import UIKit
import CoreLocation
import MapKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBAction func goToSecond() {
        let alertController: UIAlertController = UIAlertController(title: "Geocache Data Found", message: "Download Geocache Data?", preferredStyle: .Alert)
    
        let cancelAction = UIAlertAction(title: "Cancel?", style: .Cancel) { action-> Void in
            //
        }
        
        let nextAction = UIAlertAction(title: "Download", style: .Default) { (action) -> Void in
            self.performSegueWithIdentifier("toSecond", sender: self)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(nextAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    let locationManager = CLLocationManager()

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        
        mapView.setUserTrackingMode(.Follow, animated: true)
        
        let bournemouthPier = CLLocationCoordinate2D(latitude: 50.716098, longitude: -1.875780)
        let bournemouthPierRegion = CLCircularRegion(center: bournemouthPier, radius: 100, identifier: "Bournemouth Pier")
        locationManager.startMonitoringForRegion(bournemouthPierRegion)

        let boscombePier = CLLocationCoordinate2D(latitude: 50.719914, longitude: -1.84355)
        let boscombePierRegion = CLCircularRegion(center: boscombePier, radius: 100, identifier: "Boscombe Pier")
        locationManager.startMonitoringForRegion(boscombePierRegion)
        
        
        
    }


}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        
        Alamofire.request(.GET, "http://kylegoslan.co.uk/name.json").response { request, response, data, error in
            
            if let data = data {
                
                let json = JSON(data: data)
                
                for thing in json.arrayValue {
                    if thing["userName"].stringValue == region.identifier {
                        print("\(thing["text"].stringValue)")
                    }
                }
                
            }
            
        }
    }
    
}


