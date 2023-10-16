//
//  GeoLocation.swift
//  GeoEventApp
//
//  Created by Jeri Purnama on 16/10/23.
//

import CoreLocation
import RealmSwift

// MARK: - Event

struct Event {
    var name: String
    var location: CLLocation
}


class EventObject: Object {
    @Persisted var name: String
    @Persisted var latitude: Double
    @Persisted var longitude: Double
    
    convenience init(name: String, location: CLLocation) {
        self.init()
        self.name = name
        self.latitude = location.coordinate.latitude
        self.longitude = location.coordinate.longitude
    }
}
