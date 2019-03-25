//
//  ERC20Contract.swift
//  MoacAPI
//
//  Created by Liwei Zhang on 2019-02-25.
//  Copyright © 2019 Liwei Zhang. All rights reserved.
//

import Foundation

struct ERC20Contract: Decodable {
    let address: String
    let name: String
    let totalSupply: String
    let decimals: Int
    let symbol: String
}
