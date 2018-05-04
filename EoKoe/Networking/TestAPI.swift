//
//  TestAPI.swift
//  EoKoe
//
//  Created by Jaime Costa Marques on 03/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//

import Foundation
import Moya

public struct OffsetModel {
    public let start: Int = 0
    public let limit: Int = 10
}

// MARK: - Provider setup
private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}

let EokoeTestProvider = MoyaProvider<EokoeTest>(plugins: [NetworkLoggerPlugin(verbose: false, responseDataFormatter: JSONResponseDataFormatter)])


// MARK: - Provider support
private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

public enum EokoeTest {
    case users(OffsetModel)
}

extension EokoeTest : TargetType {

  var baseURL: URL {
    guard let url = URL(string: APIResource.baseUrl.rawValue) else {
       fatalError(Logger.shared.log(for: .error(message: ErrorLogStrings.EokoeTest.inavlidAPIUrl)))
    }
    
    return url
  }

  var path: String {
      switch self {
      case .users(let model):
          return "/users?start=\(model.start)&limit=\(model.limit)"
      }
  }
  
  var method: Moya.Method {
    return .get
  }
  
  var sampleData: Data {
    #if DEBUG
        switch self {
        case .users(let model):
            let json = "{\"pagination\":{\"limit\":\"\(model.limit)\",\"start\":\"\(model.limit + model.start)\"}, \"results\":[{}]}"
            return json.data(using: .utf8)!
        }
    #else
        return Data()
    #endif
  }
  
  var task: Task {
      return .requestPlain
  }
  
  var headers: [String : String]? {
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
