//
//  MoacUnit.swift
//  MoacAPI
//
//  Created by Liwei Zhang on 2019-02-27.
//  Copyright © 2019 Liwei Zhang. All rights reserved.
//

import Foundation

public enum MoacUnit: Int64 {
    case sha = 1
    case ksha = 1_000
    case gsha = 1_000_000_000
    case mc = 1_000_000_000_000_000_000
}

extension MoacUnit {
    var name: String {
        switch self {
        case .sha: return "Sha"
        case .ksha: return "Ksha"
        case .gsha: return "Gsha"
        case .mc: return "MC"
        }
    }
}
