//
//  ManufacturerWorker.swift
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

class ManufacturerWorker {
    let apiService: CarDealerAPIService

    init(apiService: CarDealerAPIService = CarDealerAPI()) {
        self.apiService = apiService
    }

    func getManufacturers(withPage page: String, onSuccess: @escaping ((CarDealerResponse) -> Void), onError: @escaping ((CarDealerError) -> Void)) {
        apiService.getManufacturers(withPage: page, onSuccess: onSuccess, onError: onError)
    }

    func getModels(withPage page: String, manufacturerId: String, onSuccess: @escaping ((CarDealerResponse) -> Void), onError: @escaping ((CarDealerError) -> Void)) {
        apiService.getModels(
            withPage: page,
            manufacturerId: manufacturerId,
            onSuccess: onSuccess,
            onError: onError
        )
    }
}