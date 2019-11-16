//
//  Client.swift
//  CarDealerApp
//
//  Created by Nisum on 11/16/19.
//  Copyright © 2019 Orlando Arzola. All rights reserved.
//

import Foundation

protocol Client {
    func genericRequest<T: Decodable>(withType type: T.Type, url: URL, onSuccess: @escaping ((T) -> Void), onError: @escaping ((CarDealerError) -> Void))
}

class UrlSessionClient: Client {
    func genericRequest<T>(withType type: T.Type, url: URL, onSuccess: @escaping ((T) -> Void), onError: @escaping ((CarDealerError) -> Void)) where T : Decodable {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                onError(.generalError)
                return
            }

            guard let data = data else {
                onError(.noCars)
                return
            }

            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    onSuccess(decodedObject)
                }
            } catch let error {
                print(error.localizedDescription)
                onError(.generalError)
            }
        }.resume()
    }


}

enum CarDealerError: Error {
    case noCars
    case generalError
}
