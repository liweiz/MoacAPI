//
//  MoacAPIProvider.swift
//  MoacAPI
//
//  Created by Liwei Zhang on 2019-02-25.
//  Copyright © 2019 Liwei Zhang. All rights reserved.
//

import Alamofire
import Foundation
import Moya

struct MoacAPIProviderFactory {
    static let policies: [String: ServerTrustPolicy] = [
        :
    ]
    
    static func makeProvider() -> MoyaProvider<MoacAPI> {
        let manager = Manager(
            configuration: URLSessionConfiguration.default,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: policies)
        )
        return MoyaProvider<MoacAPI>(manager: manager)
    }
}
