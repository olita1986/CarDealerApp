//
//  CarModelsViewController.swift
//  CarDealerApp
//
//  Created by Nisum on 11/16/19.
//  Copyright (c) 2019 Orlando Arzola. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CarModelsDisplayLogic: class {
    func displayView(viewModel: CarModels.CarModel.ViewModel)
    func displayAlert(viewModel: CarModels.Alert.ViewModel)
}

class CarModelsViewController: CommonListViewController, CarModelsDisplayLogic {
    var interactor: CarModelsBusinessLogic?
    var router: (NSObjectProtocol & CarModelsRoutingLogic & CarModelsDataPassing)?

    // MARK: Object lifecycle

    override init() {
        super.init()
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = CarModelsInteractor()
        let presenter = CarModelsPresenter()
        let router = CarModelsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.getInitialModels()
        dataTableView.delegate = self
        dataTableView.prefetchDataSource = self
    }

    // MARK: - VIP Methods

    func displayView(viewModel: CarModels.CarModel.ViewModel) {
        carModels = viewModel.models
        if let title = viewModel.title {
            self.title = title
        }
    }

    func displayAlert(viewModel: CarModels.Alert.ViewModel) {
        let alert = UIAlertController(
            title: viewModel.title,
            message: viewModel.message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension CarModelsViewController: UITableViewDataSourcePrefetching, UITableViewDelegate {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            interactor?.getMoreModels()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = carModels[indexPath.row]
        let request = CarModels.CarModel.Request(model: model)
        interactor?.modelSelected(request: request)
    }
}
