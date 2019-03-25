//
//  Balance.swift
//  MoacAPI
//
//  Created by Liwei Zhang on 2019-02-26.
//  Copyright © 2019 Liwei Zhang. All rights reserved.
//

import BigInt
import Foundation

struct Balance: BalanceProtocol {
    
    let value: BigInt
    
    init(value: BigInt) {
        self.value = value
    }
    
    var isZero: Bool {
        return value.isZero
    }
    
    var amountShort: String {
        return MoacNumberFormatter.short.string(from: value)
    }
    
    var amountFull: String {
        return MoacNumberFormatter.full.string(from: value)
    }
}

protocol BalanceProtocol {
    var value: BigInt { get }
    var amountShort: String { get }
    var amountFull: String { get }
}
