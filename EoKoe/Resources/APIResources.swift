//
//  APIResources.swift
//  EoKoe
//
//  Created by Jaime Costa Marques on 03/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//

import Foundation

public struct APIResource {
    
    public static let baseUrl: BaseURLType = .production
    public static let contentTypeIdentifier = "Content-Type"
    public static let contentTypeValue  = "application/json"
    public static let XApiKeyIdentifier = "X-API-Key"
    public static let XApiKey = "test"
    public static let acceptIdentifier = "Accept"
}

public enum BaseURLType : String {
    case production = "https://testmobiledev.eokoe.com"
}
