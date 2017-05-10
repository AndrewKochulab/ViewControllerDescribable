//
//  UIViewControllerExtension.swift
//  ViewControllerDescribable
//
//  Created by Andrew Kochulab on 4/1/17.
//  Copyright © 2017 MacInsider. All rights reserved.
//

import UIKit

public extension UIViewController {
    // MARK: - Presentation
    func present<ViewController: UIViewController>(_ controllerDetails: ViewController.Type,
                 navigationEnabled: Bool = false,
                 animated: Bool = true,
                 configuration: ((_ viewController: ViewController) -> Void)? = nil,
                 completion: ((_ viewController: ViewController) -> Void)? = nil) where ViewController: ViewControllerDescribable {
        if navigationEnabled {
            guard let navigationControllerId = controllerDetails.navigationControllerId,
                let navigationController = UIStoryboard(name: controllerDetails.storyboardName).instantiateViewController(withIdentifier: navigationControllerId) as? UINavigationController,
                let viewController = navigationController.viewControllers.first as? ViewController else {
                    return
            }
            
            configuration?(viewController)
            
            present(navigationController, animated: animated, completion: {
                completion?(viewController)
            })
        } else {
            guard let viewController = UIStoryboard(name: controllerDetails.storyboardName).instantiateViewController(withIdentifier: controllerDetails.viewControllerId) as? ViewController else {
                return
            }
            
            configuration?(viewController)
            
            present(viewController, animated: animated, completion: {
                completion?(viewController)
            })
        }
    }
}
