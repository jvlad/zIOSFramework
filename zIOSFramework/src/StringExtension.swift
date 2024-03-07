//
// Created by Vlad Zamskoi on 8/18/17.
// Copyright (c) 2017 MobileAppSoft. All rights reserved.
//

import Foundation
import UIKit

public extension String {

    static func getRandomString(withLength length: Int) -> String {
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString : NSMutableString = NSMutableString(capacity: length)
        for _ in 0 ..< length {
            let numberOfChoices = UInt32 (letters.length)
            let chosenItem = arc4random_uniform(numberOfChoices)
            randomString.appendFormat("%C", letters.character(at: Int(chosenItem)))
        }
        return randomString.description
    }

    var localized: String {
        get {
            return NSLocalizedString(self, comment: "")
        }
    }

    var addingPossessiveSuffix: String {
        get {
            let possessiveSuffix = "possessiveSuffix".localized
            let possesiveForm = self + possessiveSuffix
            return possesiveForm
        }
    }

    var inParentheses: String {
        "(" + self + ")"
    }

}
