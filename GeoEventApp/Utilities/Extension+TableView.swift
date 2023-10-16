//
//  ListEventViewController.swift
//  GeoEventApp
//
//  Created by Jeri Purnama on 16/10/23.
//

import UIKit

extension UITableView {
    func registerNib<T: UITableViewCell>(cellClass: T.Type) {
        let nib = UINib(nibName: String(describing: cellClass), bundle: nil)
        register(nib, forCellReuseIdentifier: String(describing: cellClass))
    }

    func dequeueReusableCell<T: UITableViewCell>(cellClass: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: cellClass), for: indexPath) as? T else {
            fatalError("Unable to dequeue cell with identifier: \(String(describing: cellClass))")
        }
        return cell
    }
}
