//
//  CustomAnnotationView.swift
//  GeoEventApp
//
//  Created by Jeri Purnama on 16/10/23.
//

import Foundation
import MapKit

// MARK: - CustomAnnotation

class CustomAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D

    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}

// MARK: - CustomAnnotationView

class CustomAnnotationView: MKAnnotationView {
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        if annotation is CustomAnnotation {
            self.image = UIImage(named: "custom_checkmark.png") // Replace with your custom checkmark image
            self.canShowCallout = true
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
