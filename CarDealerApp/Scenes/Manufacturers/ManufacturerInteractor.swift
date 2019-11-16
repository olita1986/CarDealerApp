//
//  ManufacturerInteractor.swift
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

protocol ManufacturerBusinessLogic {
    func getManufacturers(request: Manufacturer.Manufacturer.Request)
}

protocol ManufacturerDataStore {
}

class ManufacturerInteractor: ManufacturerBusinessLogic, ManufacturerDataStore {
    var presenter: ManufacturerPresentationLogic?
    var worker = ManufacturerWorker()

    func getManufacturers(request: Manufacturer.Manufacturer.Request) {
        presenter?.presentLoading()
        worker.getManufacturers(
            withPage: request.page,
            onSuccess: { response in

            },
            onError:  { error in
                switch error {
                case .generalError:
                    print("Something went wrong")
                case .noCars:
                    print("There are no manufacturers")
                }
            })
    }
}