//
//  CommonListViewController.swift
//  CarDealerApp
//
//  Created by Nisum on 11/16/19.
//  Copyright © 2019 Orlando Arzola. All rights reserved.
//

import UIKit

class CommonListViewController: UIViewController {

    @IBOutlet weak var dataTableView: UITableView!

    var carModels: [String] = [] {
        didSet {
            dataTableView.reloadData()
        }
    }
    var loadingRowCount = 0

    init() {
        super.init(nibName: "CommonListViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupDataTableView()
    }

    // MARK: - Helper Methods

    private func setupDataTableView() {
        dataTableView.dataSource = self
//        dataTableView.prefetchDataSource = self
        dataTableView.tableFooterView = UIView()
        dataTableView.register(UINib(nibName: "ManufacturerTableViewCell", bundle: nil), forCellReuseIdentifier: "manufacturerCell")
        dataTableView.register(UINib(nibName: "LoadingTableViewCell", bundle: nil), forCellReuseIdentifier: "loadingCell")
        dataTableView.estimatedRowHeight = 60
        dataTableView.rowHeight = UITableView.automaticDimension
    }

    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= carModels.count
    }

    func visibleIndexPathsToReload(intersecting indexPaths: [IndexPath]) -> [IndexPath] {
        let indexPathsForVisibleRows = dataTableView.indexPathsForVisibleRows ?? []
        let indexPathsIntersection = Set(indexPathsForVisibleRows).intersection(indexPaths)
        return Array(indexPathsIntersection)
    }
}

extension CommonListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carModels.count + loadingRowCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isLoadingCell(for: indexPath) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "loadingCell", for: indexPath) as? LoadingTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "manufacturerCell", for: indexPath) as? ManufacturerTableViewCell else {
            return UITableViewCell()
        }
        let manufacturer = carModels[indexPath.row]
        let viewModel = ManufacturerViewModel(
            name: manufacturer,
            row: indexPath.row
        )
        cell.setupCell(viewModel: viewModel)

        return cell
    }
}
