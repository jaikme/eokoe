//
//  Reusable.swift
//  EoKoe
//
//  Created by Jaime Costa Marques on 04/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//

import UIKit

/// `Reusable` provides an identifier for every class that inherits from `UIView`.
public protocol Reusable : class {
    
    static var identifier: String { get }
}

public extension Reusable where Self : UIView {
    
    /// Uses the `class` name to provide an identifier.
    public static var identifier: String {
        
        return String(describing: self)
    }
}

extension UIView : Reusable { }
