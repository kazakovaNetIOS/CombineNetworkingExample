//
//  NetworkManager.swift
//  CombineNetworkingExample
//
//  Created by Kazakova Nataliya on 13.10.2021.
//

import Foundation
import Combine

class NetworkManager {
    var subscriptions = Set<AnyCancellable>()
    let purchaseRequest = PurchaseRequest(products: ["chicken", "orange juice"],
                                          cost: 20)
    let service = PurchaseService(networkRequest: NativeRequestable(),
                                  environment: .development)
    func purchaseProduct() {
        service.purchaseProduct(request: purchaseRequest)
            .sink { (completion) in
                switch completion {
                case .failure(let error):
                    print("oops got an error \(error.localizedDescription)")
                case .finished:
                    print("nothing much to do here")
                }
            } receiveValue: { (responce) in
                print("got my responce here \(responce)")
            }
            .store(in: &subscriptions)
    }
}
