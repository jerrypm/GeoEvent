//
//  AddEventViewController.swift
//  GeoEventApp
//
//  Created by Jeri Purnama on 16/10/23.
//

import MapKit
import UIKit

class AddEventViewController: UIViewController {
    @IBOutlet weak var eventNameTextField: UITextField!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    var eventLocation: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleLocation()
    }
    
    @IBAction func didCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didAddEvent(_ sender: UIButton) {
        dismiss(animated: true) {
            let newEvent = Event(name: self.eventNameTextField.text ?? "", location: CLLocation(latitude: self.eventLocation?.latitude ?? 0, longitude: self.eventLocation?.longitude ?? 0))
            RealmManager.addEventToRealm(event: newEvent)
        }
    }
    
    func handleLocation() {
        if let latitude = eventLocation?.latitude, let longitude = eventLocation?.longitude {
            latitudeLabel.text = String(latitude)
            longitudeLabel.text = String(longitude)
        } else {
            latitudeLabel.text = "N/A"
            longitudeLabel.text = "N/A"
        }
    }
}
