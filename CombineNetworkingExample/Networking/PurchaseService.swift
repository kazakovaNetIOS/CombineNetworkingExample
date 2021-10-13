//
//  PurchaseService.swift
//  CombineNetworkingExample
//
//  Created by Kazakova Nataliya on 13.10.2021.
//

import Foundation
import Combine

protocol PurchaseServiceable {
    func purchaseProduct(request: PurchaseRequest) -> AnyPublisher<PurchaseResponce, NetworkError>
    func getProduct(productId: Int) -> AnyPublisher<Product, NetworkError>
    func cancelOrder(_ orderId: Int) -> AnyPublisher<Int, NetworkError>
}

class PurchaseService: PurchaseServiceable {
    let token = "abc123"
    
    func getProduct(productId: Int) -> AnyPublisher<Product, NetworkError> {
        let endpoint = PurchaseServiceEndpoints.getProduct(productId: productId)
        let request = endpoint.createRequest(token: token,
                                             environment: environment)
        return networkRequest.request(request)
    }
    
    func cancelOrder(_ orderId: Int) -> AnyPublisher<Int, NetworkError> {
        let endpoint = PurchaseServiceEndpoints.cancelOrder(orderId: orderId)
        let request = endpoint.createRequest(token: token,
                                             environment: environment)
        return networkRequest.request(request)
    }
    
    
    private var networkRequest: Requestable
    private var environment: Environment = .development
    
    init(networkRequest: Requestable, environment: Environment) {
        self.networkRequest = networkRequest
        self.environment = environment
    }
    
    func purchaseProduct(request: PurchaseRequest) -> AnyPublisher<PurchaseResponce, NetworkError> {
        let endpoint = PurchaseServiceEndpoints.purchaseProduct(request: request)
        let request = endpoint.createRequest(token: token,
                                             environment: environment)
        return networkRequest.request(request)
    }
}

public struct PurchaseRequest: Encodable {
    public let products: [String]
    public let cost: Int
}

public struct PurchaseResponce: Codable {
    public let id: Int
    public let productName: String
}
