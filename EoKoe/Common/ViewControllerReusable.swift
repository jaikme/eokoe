//
//  ViewControllerReusable.swift
//  EoKoe
//
//  Created by Jaime Costa Marques on 02/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//

import UIKit

public protocol ViewControllerReusable {
    
    static var identifier: String { get }
}

public extension ViewControllerReusable where Self : UIViewController {
    
    static var identifier: String {
        
        return String(describing: self)
    }
}

extension UIViewController : ViewControllerReusable { }
