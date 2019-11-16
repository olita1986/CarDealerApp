//
//  CarDealerResponse.swift
//  CarDealerApp
//
//  Created by Nisum on 11/16/19.
//  Copyright © 2019 Orlando Arzola. All rights reserved.
//

import Foundation

// MARK: - CarDealerResponse
struct CarDealerResponse: Codable {
    let page, pageSize, totalPageCount: Int
    let wkda: [String: String]
}
