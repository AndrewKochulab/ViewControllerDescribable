//
//  UIStoryboardExtension.swift
//  ViewControllerDescribable
//
//  Created by Andrew Kochulab on 4/1/17.
//  Copyright © 2017 MacInsider. All rights reserved.
//

import UIKit

public protocol StoryboardNameDescribable {
    var rawValue: String { get }
}

public extension UIStoryboard {
    convenience init(name: StoryboardNameDescribable) {
        self.init(name: name.rawValue, bundle: nil)
    }
}
