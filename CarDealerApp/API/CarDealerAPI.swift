//
//  CarDealerAPI.swift
//  CarDealerApp
//
//  Created by Nisum on 11/16/19.
//  Copyright © 2019 Orlando Arzola. All rights reserved.
//

import Foundation

class CarDealerAPI: CarDealerAPIService {
    let client: Client

    init(client: Client = UrlSessionClient()) {
        self.client = client
    }

    func getManufacturers(withPage page: String, onSuccess: @escaping ((CarDealerResponse) -> Void), onError: @escaping ((CarDealerError) -> Void)) {
        let formattedURLString = String(format: CarDealerConstants.API.manufacturersURL, page)
        let url = URL(string: formattedURLString)!

        client.genericRequest(withType: CarDealerResponse.self, url: url, onSuccess: onSuccess, onError: onError)
    }

    func getModels(withPage page: String, manufacturerId: String, onSuccess: @escaping ((CarDealerResponse) -> Void), onError: @escaping ((CarDealerError) -> Void)) {
        let formattedURLString = String(format: CarDealerConstants.API.modelsURL, manufacturerId, page)
        let url = URL(string: formattedURLString)!
        client.genericRequest(withType: CarDealerResponse.self, url: url, onSuccess: onSuccess, onError: onError)
    }

}

protocol CarDealerAPIService {
    func getManufacturers(withPage page: String, onSuccess: @escaping ((_ manufacturers: CarDealerResponse) -> Void), onError: @escaping ((CarDealerError) -> Void))
    func getModels(withPage page: String, manufacturerId: String, onSuccess: @escaping ((_ manufacturers: CarDealerResponse) -> Void), onError: @escaping ((CarDealerError) -> Void))
}
