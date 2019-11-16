//
//  ManufacturerInteractorTests.swift
//  CarDealerApp
//
//  Created by Nisum on 11/16/19.
//  Copyright (c) 2019 Orlando Arzola. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import CarDealerApp
import XCTest

class ManufacturerInteractorTests: XCTestCase {
    // MARK: Subject under test

    var sut: ManufacturerInteractor!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        setupManufacturerInteractor()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: Test setup

    func setupManufacturerInteractor() {
        sut = ManufacturerInteractor()
    }

    

    // MARK: Tests

    func testGetManufacturersSuccessCaseFirstPage() {
        // Given
        let workerSpy = ManufacturerWorkerSpy(carDealerResponse: CarDealerResponse(page: 0, pageSize: 15, totalPageCount: 6, wkda: ["123": "FORD"]))
        let presenterSpy = ManufacturerPresentationLogicSpy()
        sut.presenter = presenterSpy
        sut.worker = workerSpy

        // When
        sut.getManufacturers()

        // Then
        XCTAssertTrue(workerSpy.getManufacturersCalled)
        XCTAssertFalse(sut.isLoadingManufacters)
        XCTAssertTrue(presenterSpy.presentViewCalled)
    }

    func testGetManufacturersSuccessCase() {
        // Given
        let workerSpy = ManufacturerWorkerSpy(carDealerResponse: CarDealerResponse(page: 1, pageSize: 15, totalPageCount: 6, wkda: ["123": "FORD"]))
        let presenterSpy = ManufacturerPresentationLogicSpy()
        sut.presenter = presenterSpy
        sut.worker = workerSpy

        // When
        sut.getManufacturers()

        // Then
        XCTAssertTrue(workerSpy.getManufacturersCalled)
        XCTAssertFalse(sut.isLoadingManufacters)
        XCTAssertTrue(presenterSpy.presentViewCalled)
    }

    func testGetManufacturersErrorCase() {
        // Given
        let workerSpy = ManufacturerWorkerSpy(isErrorCase: true, carDealerResponse: CarDealerResponse(page: 1, pageSize: 15, totalPageCount: 6, wkda: ["123": "FORD"]))
        let presenterSpy = ManufacturerPresentationLogicSpy()
        sut.presenter = presenterSpy
        sut.worker = workerSpy

        // When
        sut.getManufacturers()

        // Then
        XCTAssertTrue(workerSpy.getManufacturersCalled)
        XCTAssertFalse(sut.isLoadingManufacters)
        XCTAssertFalse(presenterSpy.presentViewCalled)
    }

    
    func testGetModelsSuccessCase() {
        // Given
        let workerSpy = ManufacturerWorkerSpy(carDealerResponse: CarDealerResponse(page: 1, pageSize: 15, totalPageCount: 6, wkda: ["123": "FORD"]))
        let presenterSpy = ManufacturerPresentationLogicSpy()
        sut.presenter = presenterSpy
        sut.worker = workerSpy

        // When
        let request = Manufacturer.Models.Request(manufacturer: ManufacturerModel(id: "123", name: "FORD"))
        sut.getModels(request: request)

        // Then
        XCTAssertTrue(presenterSpy.presentLoadingCalled)
        XCTAssertTrue(workerSpy.getModelsCalled)
        XCTAssertTrue(presenterSpy.dismissLoadingCalled)
        XCTAssertFalse(sut.isLoadingManufacters)
        XCTAssertTrue(presenterSpy.presentModelsCalled)
    }

    func testGetModelsErrorCase() {
        // Given
        let workerSpy = ManufacturerWorkerSpy(isErrorCase: true, carDealerResponse: CarDealerResponse(page: 1, pageSize: 15, totalPageCount: 6, wkda: ["123": "FORD"]))
        let presenterSpy = ManufacturerPresentationLogicSpy()
        sut.presenter = presenterSpy
        sut.worker = workerSpy

        // When
        let request = Manufacturer.Models.Request(manufacturer: ManufacturerModel(id: "123", name: "FORD"))
        sut.getModels(request: request)

        // Then
        XCTAssertTrue(presenterSpy.presentLoadingCalled)
        XCTAssertTrue(workerSpy.getModelsCalled)
        XCTAssertTrue(presenterSpy.dismissLoadingCalled)
        XCTAssertFalse(sut.isLoadingManufacters)
        XCTAssertFalse(presenterSpy.presentModelsCalled)
    }

}