//
//  ManufacturerWorkerSpy.swift
//  CarDealerAppTests
//
//  Created by Nisum on 11/16/19.
//  Copyright © 2019 Orlando Arzola. All rights reserved.
//

@testable import CarDealerApp

class ManufacturerWorkerSpy: ManufacturerWorker {

    let carDealerResponse: CarDealerResponse

    let isErrorCase: Bool

    init(isErrorCase: Bool = false,
         carDealerResponse: CarDealerResponse) {
        self.isErrorCase = isErrorCase
        self.carDealerResponse = carDealerResponse
    }

    var getManufacturersCalled = false
    var getModelsCalled = false

    override func getManufacturers(withPage page: String,
                                   onSuccess: @escaping ((CarDealerResponse) -> Void),
                                   onError: @escaping ((CarDealerError) -> Void)) {
        getManufacturersCalled = true
        if isErrorCase {
            onError(.generalError)
        } else {
            onSuccess(carDealerResponse)
        }

    }

    override func getModels(withPage page: String,
                            manufacturerId: String,
                            onSuccess: @escaping ((CarDealerResponse) -> Void),
                            onError: @escaping ((CarDealerError) -> Void)) {
        getModelsCalled = true
        if isErrorCase {
            onError(.generalError)
        } else {
            onSuccess(carDealerResponse)
        }
    }
}
