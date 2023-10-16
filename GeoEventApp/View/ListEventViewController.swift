//
//  ListEventViewController.swift
//  GeoEventApp
//
//  Created by Jeri Purnama on 16/10/23.
//

import UIKit

// MARK: - ListEventViewController

class ListEventViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var eventViewModel = EventViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Event list"
        setupTable()
    }

    private func setupTable() {
        tableView.dataSource = self
        tableView.registerNib(cellClass: ListEventTableViewCell.self)
    }
}

// MARK: UITableViewDataSource

extension ListEventViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventViewModel.fetchEvents().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellClass: ListEventTableViewCell.self, for: indexPath)
        cell.setupData(data: eventViewModel.fetchEvents()[indexPath.row])
        return cell
    }
}
