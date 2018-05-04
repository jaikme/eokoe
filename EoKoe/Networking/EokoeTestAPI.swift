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
                // TODO: Load from external file
                let json = """
                    {
                        "pagination": {
                            "limit": \(model.limit),
                            "start": \(model.limit + model.start)
                        },
                        "results": [
                            {
                                "avg_customer": 3.47404183724844,
                                "bio": {
                                    "mini": "Rump tri-tip beef ball tip porchetta. Cow meatloaf rump strip steak ham."
                                },
                                "id": 1,
                                "name": {
                                    "first": "Loiva",
                                    "last": "Nunes",
                                    "title": "Mrs"
                                },
                                "nat": "BR",
                                "picture": {
                                    "large": "https://randomuser.me/api/portraits/women/90.jpg",
                                    "medium": "https://randomuser.me/api/portraits/med/women/90.jpg",
                                    "thumbnail": "https://randomuser.me/api/portraits/thumb/women/90.jpg"
                                }
                            }
                        ]
                    }
                """
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

// MARK: - Response Handlers

extension Moya.Response {
    func tryParseUsers() throws -> Users {
        guard let usersResults = Users.init(data: self.data) else {
            throw MoyaError.jsonMapping(self)
        }
        return usersResults
    }
}
