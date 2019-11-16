//
//  ManufacturerRoutingLogicSpy.swift
//  CarDealerAppTests
//
//  Created by Nisum on 11/16/19.
//  Copyright © 2019 Orlando Arzola. All rights reserved.
//

import Foundation
@testable import CarDealerApp

class ManufacturerRoutingLogicSpy: NSObject, ManufacturerRoutingLogic, ManufacturerDataPassing  {
    var routeToModelViewControllerCalled = false

    var dataStore: ManufacturerDataStore?

    func routeToModelViewController() {
        routeToModelViewControllerCalled = true
    }
}
