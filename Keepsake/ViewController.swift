import UIKit
import CoreLocation
import MapKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController {
    @IBOutlet weak var downloadButton: UIButton!
    var triggeredRegion: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapBournePier()
        downloadButton.enabled = false
    }
    
    @IBAction func goToSecond() {
        let alertController: UIAlertController = UIAlertController(title: "Geocache Data Found", message: "Download Geocache Data?", preferredStyle: .Alert)
    
        let cancelAction = UIAlertAction(title: "Cancel ", style: .Cancel) { action-> Void in
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
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toSecond" {
            let vc = segue.destinationViewController as! SecondViewController
            vc.name = triggeredRegion
        }
        
    }

   
    func mapBournePier() {
//Coordinates
        let bourneLat: CLLocationDegrees = 50.716098
        let bourneLong: CLLocationDegrees = -1.875780
        
        let bourneCoordinate = CLLocationCoordinate2D(latitude: bourneLat, longitude: bourneLong)
        
//Span
        let latDelta: CLLocationDegrees = 0.01
        let longDelta: CLLocationDegrees = 0.01
        
        let bourneSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        let bourneRegion = MKCoordinateRegion(center: bourneCoordinate, span: bourneSpan)
        
        
        
        mapView.setRegion(bourneRegion, animated: true)
        
        
        let bourneAnnotation = MKPointAnnotation()
        bourneAnnotation.title = "Bournemouth Seafront"
        bourneAnnotation.subtitle = "My last memories"
        bourneAnnotation.coordinate = CLLocationCoordinate2DMake(50.716098, -1.875780)
        mapView.addAnnotation(bourneAnnotation)
        
        let boscAnnotation = MKPointAnnotation()
        boscAnnotation.title = "Boscombe Pier"
        boscAnnotation.subtitle = "Knew there was another Pier"
        boscAnnotation.coordinate = CLLocationCoordinate2DMake(50.719914, -1.84355)
        mapView.addAnnotation(boscAnnotation)
        
        let gardAnnotation = MKPointAnnotation()
        gardAnnotation.title = "Bournemouth Gardens"
        gardAnnotation.subtitle = "Caged Beauty"
        gardAnnotation.coordinate = CLLocationCoordinate2DMake(50.719799, -1.879439)
        mapView.addAnnotation(gardAnnotation)
       
//Map Pin Annotations

        
        
        
    
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        
        mapView.setUserTrackingMode(.Follow, animated: true)
        
        let bournemouthPier = CLLocationCoordinate2D(latitude: 50.716098, longitude: -1.875780)
        let bournemouthPierRegion = CLCircularRegion(center: bournemouthPier, radius: 100, identifier: "Bournemouth Pier")
        locationManager.startMonitoringForRegion(bournemouthPierRegion)

        let boscombePier = CLLocationCoordinate2D(latitude: 50.719914, longitude: -1.84355)
        let boscombePierRegion = CLCircularRegion(center: boscombePier, radius: 100, identifier: "Boscombe Pier")
        locationManager.startMonitoringForRegion(boscombePierRegion)
        
        let bournemouthGardens = CLLocationCoordinate2D(latitude: 50.719799, longitude: -1.879439)
        let bournemouthGardensRegion = CLCircularRegion(center: bournemouthGardens, radius: 100, identifier: "Bournemouth Gardens")
        locationManager.startMonitoringForRegion(bournemouthGardensRegion)


        
        
    }


}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        triggeredRegion = region.identifier
        downloadButton.enabled = true
    
    }
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        downloadButton.enabled = false
    }
    
}


