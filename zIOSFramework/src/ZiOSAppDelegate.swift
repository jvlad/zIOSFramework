//
// Created by Vlad Zamskoi on 3/4/19.
// Copyright (c) 2019 MobileAppSoft. All rights reserved.
//

import Foundation
import UIKit

open class ZiOSAppDelegate: UIResponder, UIApplicationDelegate {

    private var orientationLock = UIInterfaceOrientationMask.all

    func setOrientationLockedToLandscape(_ isLockedToLandscape: Bool) {
        var orientationToRotateTo = UIInterfaceOrientation.unknown
        var orientationToLockTo = UIInterfaceOrientationMask.all

        if isLockedToLandscape {
            orientationToRotateTo = UIInterfaceOrientation.landscapeLeft
            orientationToLockTo = .landscape
        }

        orientationLock =  orientationToLockTo
        UIDevice.current.setValue(orientationToRotateTo.rawValue, forKey: "orientation")
        UINavigationController.attemptRotationToDeviceOrientation()
    }


    public func application(_ application: UIApplication,
                     supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return self.orientationLock
    }

}
