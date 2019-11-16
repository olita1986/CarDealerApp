//
//  CommonInteractor.swift
//  CarDealerApp
//
//  Created by Nisum on 11/16/19.
//  Copyright © 2019 Orlando Arzola. All rights reserved.
//

import Foundation

class CommonInteractor {

    var isLoadingManufacters = false
    var currentPage = 0
    var totalPageCount = 0
    var currentManufacturersCount = 0

    // MARK: - Helper Methods

    func calculateIndexPathsToReload(from newModeratorsCount: Int) -> [IndexPath] {
        let startIndex = currentManufacturersCount - newModeratorsCount
        let endIndex = startIndex + newModeratorsCount
        return (startIndex..<endIndex).map { IndexPath(row: $0, section: 0) }
    }
}
