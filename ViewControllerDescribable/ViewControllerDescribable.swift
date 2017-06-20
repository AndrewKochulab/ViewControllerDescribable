//
//  ViewControllerDescribable.swift
//  ViewControllerDescribable
//
//  Created by Andrew Kochulab on 4/1/17.
//  Copyright © 2017 MacInsider. All rights reserved.
//

import UIKit

public protocol ViewControllerDescribable: class {
    static var viewControllerId: String { get }
    static var navigationControllerId: String? { get }
    static var storyboardName: StoryboardNameDescribable { get }
}

extension ViewControllerDescribable where Self: UIViewController {
    static public var viewControllerId: String {
        return String(describing: self)
    }
    
    static public var navigationControllerId: String? {
        return nil
    }
    
    static public func instantiated(configuration: ((_ viewController: Self) -> Void)? = nil) -> Self {
        let viewController = UIStoryboard(name: Self.storyboardName).instantiateViewController(withIdentifier: Self.viewControllerId) as! Self
        
        configuration?(viewController)
        
        return viewController
    }
    
    static public func instantiatedNavigation(configuration: ((_ viewController: Self) -> Void)? = nil) -> UINavigationController? {
        guard let navigationControllerId = Self.navigationControllerId,
            let navigationController = UIStoryboard(name: Self.storyboardName).instantiateViewController(withIdentifier: navigationControllerId) as? UINavigationController,
            let viewController = navigationController.viewControllers.first as? Self else {
                return nil
        }
        
        configuration?(viewController)
        
        return navigationController
    }
}
