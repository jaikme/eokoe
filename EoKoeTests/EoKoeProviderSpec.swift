//
//  EoKoeProviderSpec.swift
//  EoKoeTests
//
//  Created by Jaime Costa Marques on 02/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//


import Quick
import Nimble
import Foundation
import Moya

@testable import EoKoe

final class EoKoeProviderSpec: QuickSpec {
    override func spec() {
        var provider: MoyaProvider<EokoeTestAPI>!
        beforeEach {
            provider = MoyaProvider<EokoeTestAPI>(stubClosure: MoyaProvider.immediatelyStub)
        }
        it("returns  data for users list request") {
            var json: String?
            let target: EokoeTestAPI = .users(OffsetModel(start: 0, limit: 1))
            provider.request(target) { result in
                if case let .success(response) = result {
                    json = String(data: response.data, encoding: .utf8)
                }
            }
            let sampleData = String(data: target.sampleData, encoding: .utf8)
            expect(json).to(equal(sampleData))
        }
    }
}
