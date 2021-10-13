//
//  Environment.swift
//  CombineNetworkingExample
//
//  Created by Kazakova Nataliya on 13.10.2021.
//

import Foundation

public enum Environment: String, CaseIterable {
    case development
    case staging
    case production
}

extension Environment {
    var purchaseServiceBaseUrl: String {
        switch self {
        case .development:
            return "https://dev-combine.com/purchaseService"
        case .staging:
            return "https://stg-combine.com/purchaseService"
        case .production:
            return "https://combine.com/purchaseService"
        }
    }
}
