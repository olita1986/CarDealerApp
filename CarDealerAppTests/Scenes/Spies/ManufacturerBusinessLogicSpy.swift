//
//  ManufacturerBusinessLogicSpy.swift
//  CarDealerAppTests
//
//  Created by Nisum on 11/16/19.
//  Copyright © 2019 Orlando Arzola. All rights reserved.
//

@testable import CarDealerApp

// MARK: Test doubles

class ManufacturerBusinessLogicSpy: ManufacturerBusinessLogic {
    var getManufacturersCalled = false
    var getModelsCalled = false

    func getManufacturers() {
        getManufacturersCalled = true
    }

    func getModels(request: Manufacturer.Models.Request) {
        getModelsCalled = true
    }
}
