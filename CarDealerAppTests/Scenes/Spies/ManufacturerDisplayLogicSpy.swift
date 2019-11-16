//
//  ManufacturerDisplayLogicSpy.swift
//  CarDealerAppTests
//
//  Created by Nisum on 11/16/19.
//  Copyright © 2019 Orlando Arzola. All rights reserved.
//

@testable import CarDealerApp

// MARK: Test doubles

class ManufacturerDisplayLogicSpy: ManufacturerDisplayLogic {
    var displayLoadingCalled = false
    var dismissLoadingCalled = false
    var displayViewCalled = false
    var displayModelsCalled = false

    func displayLoading() {
        displayLoadingCalled = true
    }

    func dismissLoading() {
        dismissLoadingCalled = true
    }

    func displayView(viewModel: Manufacturer.Manufacturer.ViewModel) {
        displayViewCalled = true
    }

    func displayModels() {
        displayModelsCalled = true
    }
}
