//
//  EventViewController.swift
//  GeoEventApp
//
//  Created by Jeri Purnama on 16/10/23.
//

import CoreLocation
import MapKit
import UIKit

// MARK: - EventViewController

class EventViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!

    var eventViewModel = EventViewModel()
    let manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = eventViewModel.titleEvent
        setupNavigation()
        setupMapView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        requestLocation()
    }

    func requestLocation() {
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    private func setupMapView() {
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }

    private func setupNavigation() {
        let burgerMenuButton = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(handleRightMenu))
        navigationItem.rightBarButtonItem = burgerMenuButton

        // MARK: When Tap map

        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        mapView.addGestureRecognizer(longPressGesture)
    }

    @objc func handleRightMenu() {
        let viewController = ListEventViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

    @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            let touchPoint = gestureRecognizer.location(in: mapView)
            let eventCoordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)

            // Create (Pin) new Event
            let addEventVC = AddEventViewController()
            addEventVC.eventLocation = eventCoordinate
            addEventVC.modalPresentationStyle = .fullScreen

            present(addEventVC, animated: true, completion: nil)
        }
    }
}

// MARK: CLLocationManagerDelegate

extension EventViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()
            render(location)
        }
    }

    func render(_ location: CLLocation) {
        let coordinate = location.coordinate

        let radius = 5000.0
        let regionCircle = CLCircularRegion(center: coordinate, radius: radius, identifier: "Event Region")

        for event in eventViewModel.fetchEvents() {
            let eventLocation = event.location

            if regionCircle.contains(eventLocation.coordinate) {
                eventViewModel.nearbyEvents.append(event)

                let eventPin = MKPointAnnotation()
                eventPin.coordinate = eventLocation.coordinate
                eventPin.title = event.name
                mapView.addAnnotation(eventPin)
            }
        }
    }
}
