//
//  UINavigationControllerExtension.swift
//  ViewControllerDescribable
//
//  Created by Andrew Kochulab on 4/1/17.
//  Copyright © 2017 MacInsider. All rights reserved.
//

import UIKit

extension UINavigationController {
    // MARK - Push
    func push<ViewController: UIViewController>(_ controllerDetails: ViewController.Type,
              animated: Bool = true,
              configuration: ((_ viewController: ViewController) -> Void)? = nil) where ViewController: ViewControllerDescribable {
        guard let viewController = UIStoryboard.initialized(with: controllerDetails.storyboardName).instantiateViewController(withIdentifier: controllerDetails.viewControllerId) as? ViewController else {
            return
        }
        
        configuration?(viewController)
        
        pushViewController(viewController, animated: animated)
    }
}
