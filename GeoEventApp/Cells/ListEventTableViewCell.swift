//
//  ListEventTableViewCell.swift
//  GeoEventApp
//
//  Created by Jeri Purnama on 16/10/23.
//

import UIKit

class ListEventTableViewCell: UITableViewCell {
    @IBOutlet weak var nameEvent: UILabel!
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupData(data: Event) {
        nameEvent.text = "Event Name: \(data.name)"
        latitude.text = "Latitude: \(data.location.coordinate.latitude)"
        longitude.text = "Longitude: \(data.location.coordinate.longitude)"
    }
}
