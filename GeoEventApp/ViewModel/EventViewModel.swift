//
//  EventViewModel.swift
//  GeoEventApp
//
//  Created by Jeri Purnama on 16/10/23.
//

import CoreLocation
import Foundation

class EventViewModel {
    var events: [Event] = []
    var titleEvent: String = "Geolocation Event"
    var nearbyEvents: [Event] = []

    func fetchEvents() -> [Event] {
        return RealmManager.getAllEventsFromRealm()
    }
}
