//
//  Storyboard.swift
//  EoKoe
//
//  Created by Jaime Costa Marques on 04/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//

import UIKit

// MARK: App Storyboards / routes

enum Storyboards {
    case usersList
}

extension Storyboards {
    
    var instance: UIStoryboard {
        
        switch self {
        case .usersList:
            return createStoryboard(from: "UsersList")
        }
    }
    
    private func createStoryboard(from name: String) -> UIStoryboard {
        let storyboard = UIStoryboard(name: name, bundle: .main)
        return storyboard
    }
}

// MARK: Storyboard helper

final class Storyboard {
    
    private init() { }
    static let shared = Storyboard()
    
    func createViewController<T: ViewControllerReusable>(by type: T.Type, from storyboard: Storyboards) -> T {
        
        guard let controller = storyboard.instance.instantiateViewController(withIdentifier: T.identifier) as? T else {
            fatalError("It was not possible to create the ViewController '\(T.identifier)' because the StoryboardID has a different identifier: '\(T.identifier)'.")
        }
        
        return controller
    }
}
