//
//  Requestable.swift
//  CombineNetworkingExample
//
//  Created by Kazakova Nataliya on 12.10.2021.
//

import Foundation
import Combine

public protocol Requestable {
    var requestTimeout: Float { get }
    
    func request<T: Codable>(_ req: NetworkRequest) -> AnyPublisher<T, NetworkError>
}
