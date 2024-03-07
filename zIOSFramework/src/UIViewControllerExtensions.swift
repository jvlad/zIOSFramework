//
// Created by Vlad Zamskoi on 3/4/19.
// Copyright (c) 2019 MobileAppSoft. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    public func setOrientationLockedToLandscape(_ isLockedToLandscape: Bool) {
        if let delegate = UIApplication.shared.delegate as? ZiOSAppDelegate {
            delegate.setOrientationLockedToLandscape(isLockedToLandscape)
        }
    }
}
