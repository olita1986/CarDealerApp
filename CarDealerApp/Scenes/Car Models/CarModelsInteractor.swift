//
//  CarModelsInteractor.swift
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

protocol CarModelsBusinessLogic {
    func getInitialModels()
    func getMoreModels()
    func modelSelected(request: CarModels.CarModel.Request)
}

protocol CarModelsDataStore {
    var modelsResponse: CarDealerResponse! { get set }
    var manufacturer: String { get set }
}

class CarModelsInteractor: CommonInteractor, CarModelsBusinessLogic, CarModelsDataStore {
    var presenter: CarModelsPresentationLogic?
    var worker = CarModelsWorker()

    var modelsResponse: CarDealerResponse!
    var manufacturer: String = ""

    func getInitialModels() {
        self.currentPage += 1
        let response = CarModels.CarModel.Response(
            carDealerResponse: modelsResponse,
            indexPathsToReload: [],
            addLoadingRow: false,
            title: manufacturer
        )
        presenter?.presentView(response: response)
    }

    func getMoreModels() {
        if totalPageCount > 0 {
            if currentPage > totalPageCount - 1 {
                return
            }
        }
        guard !isLoadingManufacters else {
            return
        }
        worker.getModels(
            withPage: "0",
            manufacturerId: manufacturer,
            onSuccess: { [unowned self] response in
                self.currentPage += 1
                self.isLoadingManufacters = false
                self.totalPageCount = response.totalPageCount
                self.currentManufacturersCount += response.wkda.count
                self.modelsResponse = response
                if response.page > 0 {
                    let indexPathsToReload = self.calculateIndexPathsToReload(
                        from: response.wkda.count
                    )
                    let response = CarModels.CarModel.Response(
                        carDealerResponse: response,
                        indexPathsToReload: indexPathsToReload,
                        addLoadingRow: response.page < response.totalPageCount - 1,
                        title: ""
                    )
                    self.presenter?.presentView(response: response)
                } else {
                    let response = CarModels.CarModel.Response(
                        carDealerResponse: response,
                        indexPathsToReload: [],
                        addLoadingRow: true,
                        title: ""
                    )
                    self.presenter?.presentView(response: response)
                }
            },
            onError:  { (error) in
                self.isLoadingManufacters = false
                switch error {
                case .generalError:
                    print("Something went wrong")
                case .noCars:
                    print("There are no manufacturers")
                }
            }
        )
    }

    func modelSelected(request: CarModels.CarModel.Request) {
        let response = CarModels.Alert.Response(
            title: manufacturer,
            message: request.model
        )
        self.presenter?.presentSelection(response: response)
    }
}
