//
//  NibCreatable.swift
//  EoKoe
//
//  Created by Jaime Costa Marques on 04/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//

import UIKit

/// `NibCreatable` provides an easy way to create Nibs.
public protocol NibCreatable {
    
    func makeNib<T: Reusable>(for type: T.Type) -> UINib
}

public extension NibCreatable {
    
    /// Allows create a `UINib` just passing the `class` type.
    ///
    /// - Parameter type: The type to create the `UINib`.
    /// - Returns: Returns a `UINib`.
    func makeNib<T: Reusable>(for type: T.Type) -> UINib {
        
        let bundle = Bundle(for: type.self)
        let nib = UINib(nibName: T.identifier, bundle: bundle)
        
        return nib
    }
}

