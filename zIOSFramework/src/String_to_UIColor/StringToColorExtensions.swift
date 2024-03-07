//
// Created by Vlad Zamskoi on 8/18/17.
// Copyright (c) 2017 MobileAppSoft. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {

    /**
    String should be of form ARGB, where
    A - Alpha hex value
    R - Red hex value
    G - Green hex value
    B - Blue hex value

    The supported hex_color_string formats are:
    * "#ff00bbaa"
    * "ff00bbaa"
    * "#ff00bb"
    * "ff00bb"
    * "#f0ba"
    * "f0ba"
    * "#f0b"
    * "f0b"
    */
    convenience init?(hexColorString: String) {
        guard let c = HexColorToRGBConverter.convert(hexColorString) else { return nil }
        self.init(r: c.r,
                    g: c.g,
                    b: c.b,
                    a: c.a)
    }

    /**
        Supports both modes:
        * when all values are less than 1.0
        * when any value is bigger than 1.0. If so, all values are divided by 255.0
    */
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        let normalizer = CGFloat(255.0)
        let r2 = r > normalizer ? normalizer : r
        let g2 = g > normalizer ? normalizer : g
        let b2 = b > normalizer ? normalizer : b
        let a2 = a > normalizer ? normalizer : a
        var isNormalizationNeeded = false
        [r2, g2, b2, a2].forEach {
            if $0 > 1.0 {
                isNormalizationNeeded = true
            }
        }
        let r: CGFloat = isNormalizationNeeded ? (r2 / normalizer) : r2
        let g: CGFloat = isNormalizationNeeded ? (g2 / normalizer) : g2
        let b: CGFloat = isNormalizationNeeded ? (b2 / normalizer) : b2
        let a: CGFloat = isNormalizationNeeded ? (a2 / normalizer) : a2
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}

public extension String {

    /**
    Interprets the string as ARGB
    The supported formats are:
    * "#ff00bbaa"
    * "ff00bbaa"
    * "#ff00bb"
    * "ff00bb"
    * "#f0ba"
    * "f0ba"
    * "#f0b"
    * "f0b"
    */
    public func toColor() -> UIColor? {
        UIColor.init(hexColorString: self)
    }
}
