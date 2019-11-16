//
//  ManufacturerPresentationLogicSpy.swift
//  CarDealerAppTests
//
//  Created by Nisum on 11/16/19.
//  Copyright © 2019 Orlando Arzola. All rights reserved.
//

@testable import CarDealerApp

// MARK: Test doubles

class ManufacturerPresentationLogicSpy: ManufacturerPresentationLogic {
    var presentLoadingCalled = false
    var dismissLoadingCalled = false
    var presentViewCalled = false
    var presentModelsCalled = false

    func presentLoading() {
        presentLoadingCalled = true
    }

    func dismissLoading() {
        dismissLoadingCalled = true
    }

    func presentView(response: Manufacturer.Manufacturer.Response) {
        presentViewCalled = true
    }

    func presentModels() {
        presentModelsCalled = true
    }
}
