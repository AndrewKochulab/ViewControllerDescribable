//
//  UIStoryboardExtension.swift
//  ViewControllerDescribable
//
//  Created by Andrew Kochulab on 4/1/17.
//  Copyright © 2017 MacInsider. All rights reserved.
//

import UIKit

extension UIStoryboard {
    public enum Name: String {
        case main = "Main",
        launchScreen = "LaunchScreen"
    }
    
    static public func initialized(with name: Name) -> UIStoryboard {
        return UIStoryboard(name: name.rawValue, bundle: nil)
    }
}
