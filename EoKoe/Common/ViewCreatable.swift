//
//  ViewCreatable.swift
//  EoKoe
//
//  Created by Jaime Costa Marques on 02/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//

import UIKit

protocol ViewCreatable { }

extension ViewCreatable where Self : UIView {
    
    static func makeXib() -> Self {
        
        let identifier = String(describing: Self.self)
        guard let view = Bundle.main.loadNibNamed(identifier, owner: self, options: nil)?.first as? Self else {
            
            fatalError("It was not possible create Xib with identifier: \(identifier). The '.xib' and '.swift' files must have the same name.")
        }
        
        return view
    }
}

extension UIView : ViewCreatable { }
