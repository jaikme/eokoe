//
//  EokoeTestAPI.swift
//  EoKoe
//
//  Created by Jaime Costa Marques on 03/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//

import Foundation
import Moya

public struct OffsetModel {
    public let start: Int
    public let limit: Int
    
    init(start: Int = 0, limit: Int = 10) {
        self.start = start
        self.limit = limit
    }
}

// MARK: - Provider support
private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

public enum EokoeTestAPI {
    case users(OffsetModel)
    case userDetails(id: String)
}

extension EokoeTestAPI : TargetType {
    
    public var baseURL: URL {
        guard let url = URL(string: APIResource.baseUrl.rawValue) else {
            fatalError(Logger.shared.log(for: .error(message: ErrorLogStrings.EokoeTest.inavlidAPIUrl)))
        }
        
        return url
    }
    
    public var path: String {
        switch self {
        case .users(_):
            return "/users"
        case .userDetails(let id):
            return "/user/\(id)"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        #if DEBUG
            switch self {
            case .users(let model):
                let json = "{\"pagination\":{\"limit\":\"\(model.limit)\",\"start\":\"\(model.limit + model.start)\"}, \"results\":[{}]}"
                return json.data(using: .utf8)!
            case .userDetails(_):
                return Data()
            }
        #else
            return Data()
        #endif
    }
    
    public var task: Task {
        switch self {
        case .users(let model):
            return .requestParameters(parameters: ["start": model.start, "limit": model.limit], encoding: URLEncoding.queryString)
        case .userDetails(_):
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return [
            APIResource.XApiKeyIdentifier: APIResource.XApiKey,
            APIResource.contentTypeIdentifier: APIResource.contentTypeValue
        ]
    }
    
}

public func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}

// MARK: - Response Handlers
extension Moya.Response {
    func mapNSArray() throws -> NSArray {
        let any = try self.mapJSON()
        guard let array = any as? NSArray else {
            throw MoyaError.jsonMapping(self)
        }
        return array
    }
}
