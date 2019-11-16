//
//  CarDealerConstants .swift
//  CarDealerApp
//
//  Created by Nisum on 11/16/19.
//  Copyright © 2019 Orlando Arzola. All rights reserved.
//

import Foundation

enum CarDealerConstants {
    enum API {
        static var manufacturersURL = "http://api-aws-eu-qa-1.auto1-test.com/v1/car-types/manufacturer?page=%@&pageSize=15&wa_key=coding-puzzle-client-449cc9d"
        static var modelsURL = "http://api-aws-eu-qa-1.auto1-test.com/v1/car-types/main-types?manufacturer=%@&page=%@&pageSize=15&wa_key=coding-puzzle-client-449cc9d"
    }
}
