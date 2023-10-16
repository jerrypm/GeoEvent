//
//  EventRelams.swift
//  GeoEventApp
//
//  Created by Jeri Purnama on 16/10/23.
//

import CoreLocation
import RealmSwift

class RealmManager {
    // MARK: Add Data

    static func addEventToRealm(event: Event) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(EventObject(name: event.name, location: event.location))
            }
        } catch {
            // Handle error
        }
    }

    // MARK: Delete Data

    static func deleteEventFromRealm(event: EventObject) {
        do {
            let realm = try Realm()
            if let eventObject = realm.objects(EventObject.self).filter("name = %@", event.name).first {
                try realm.write {
                    realm.delete(eventObject)
                }
            }
        } catch {
            // Handle error
        }
    }

    // MARK: Get All Data

    static func getAllEventsFromRealm() -> [Event] {
        do {
            let realm = try Realm()
            let eventObjects = realm.objects(EventObject.self)
            let events = Array(eventObjects).map { Event(name: $0.name, location: CLLocation(latitude: $0.latitude, longitude: $0.longitude)) }
            return events
        } catch {
            // Handle error
            return []
        }
    }
}
