//
//  Provider.swift
//  EoKoe
//
//  Created by Jaime Costa Marques on 04/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//

import Foundation
import Moya

public final class Provider {
    public static let shared = Provider()
    
    var EokoeTestProvider: MoyaProvider<EokoeTestAPI> {
        return MoyaProvider<EokoeTestAPI>(plugins: [NetworkLoggerPlugin(verbose: false, responseDataFormatter: JSONResponseDataFormatter)])
    }
 
}

// MARK: - Provider setup

extension Provider {

    private func JSONResponseDataFormatter(_ data: Data) -> Data {
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
            let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
            return prettyData
        } catch {
            return data // fallback to original data if it can't be serialized.
        }
    }
}
