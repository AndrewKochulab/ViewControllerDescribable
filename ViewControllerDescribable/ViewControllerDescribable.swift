//
//  ViewControllerDescribable.swift
//  ViewControllerDescribable
//
//  Created by Andrew Kochulab on 4/1/17.
//  Copyright © 2017 MacInsider. All rights reserved.
//

import UIKit

protocol ViewControllerDescribable: class {
    static var viewControllerId: String { get }
    static var navigationControllerId: String? { get }
    static var storyboardName: UIStoryboard.Name { get }
}

extension ViewControllerDescribable where Self: UIViewController {
    static var viewControllerId: String {
        return String(describing: self)
    }
    
    static var navigationControllerId: String? {
        return nil
    }
    
    static var storyboardName: UIStoryboard.Name {
        return .main
    }
    
    static func instantiated(configuration: ((_ viewController: Self) -> Void)? = nil) -> Self {
        let viewController = UIStoryboard.initialized(with: Self.storyboardName).instantiateViewController(withIdentifier: Self.viewControllerId) as! Self
        
        configuration?(viewController)
        
        return viewController
    }
}
