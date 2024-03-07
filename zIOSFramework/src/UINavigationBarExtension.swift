//
// Created by Vlad Zamskoi on 8/9/17.
// Copyright (c) 2017 MobileAppSoft. All rights reserved.
//

import Foundation
import UIKit

public extension UINavigationBar {
    func setTitleTextColor(_ color: UIColor) {
        if var titleTextAttributes = titleTextAttributes {
            titleTextAttributes[NSAttributedString.Key.foregroundColor] = color
        } else {
            titleTextAttributes = [NSAttributedString.Key.foregroundColor : color]
        }
    }
}
