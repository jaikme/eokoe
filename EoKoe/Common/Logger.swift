//
//  Logger.swift
//  EoKoe
//
//  Created by Jaime Costa Marques on 03/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//

import Foundation

public final class Logger {
    
    private init() { }
    public static let shared = Logger()
    
    public enum LogType {
        case info(message: String)
        case warning(message: String)
        case error(message: String)
    }
    
    @discardableResult
    public func log(for type: LogType) -> String {
        let log = callLog(for: type)
        #if DEBUG
        print(log)
        #endif
        
        // ... Can add external logger platform here
        
        return log
    }
    
    @discardableResult
    private func callLog(for type: LogType) -> String {
        switch type {
        case let .info(message):
            return "ℹ️ \(message)"
        case let .warning(message):
            return "⚠️ \(message)"
        case let .error(message):
            return "🔴 \(message)"
        }
    }
}
