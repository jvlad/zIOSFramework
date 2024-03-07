//
// Created by Vlad Zamskoi on 8/19/17.
// Copyright (c) 2017 MobileAppSoft. All rights reserved.
//

import UIKit

class HexColorToRGBConverter {
    /**
        The four components of a color are encoded in the following way:

        For 8 digits hex string
        (A & 0xff) << 24 | (R & 0xff) << 16 | (G & 0xff) << 8 | (B & 0xff);

        OR
        For 4 digits hex string
        (A & 0xf) << 12 | (R & 0xf) << 8 | (G & 0xff) << 4 | (B & 0xff);


        Therefore the supported hex_color_string formats are:
            * "#ff00bbaa"
            * "ff00bbaa"
            * "#ff00bb"
            * "ff00bb"
            * "#f0ba"
            * "f0ba"
            * "#f0b"
            * "f0b"
    */
    static func convert(_ hex: String) -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)? {
        guard isValidHexColorString(hex) else { return nil }
        let hexWithoutPrefix = hex.replacingOccurrences(of: "#", with: "")
        return convertValidHexColorToRGB(hexWithoutPrefix)
    }

    private static func convertValidHexColorToRGB(_ hexColorString: String) -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)? {
        var rgb: UInt32 = 0
        guard Scanner(string: hexColorString).scanHexInt32(&rgb)
        , let config = resolveConfiguration(of: hexColorString) else {
            return nil
        }

        let (bitsPerColorComponent, redComponentOffset, shortToLongFormMultiplier, isAlphaSpecified) = config
        let componentMask = 0xFF / shortToLongFormMultiplier
        let normalizer = CGFloat(255.0)
        let redOffsetInBits = UInt32(redComponentOffset * bitsPerColorComponent)
        let greenOffsetInBits = UInt32((redComponentOffset - 1) * bitsPerColorComponent)
        let blueOffsetInBits = UInt32((redComponentOffset - 2) * bitsPerColorComponent)
        let r = CGFloat(((rgb & (componentMask << redOffsetInBits)) >> redOffsetInBits)
                * shortToLongFormMultiplier) / normalizer
        let g = CGFloat(((rgb & (componentMask << greenOffsetInBits)) >> greenOffsetInBits)
                * shortToLongFormMultiplier) / normalizer
        let b = CGFloat(((rgb & (componentMask << blueOffsetInBits)) >> blueOffsetInBits)
                * shortToLongFormMultiplier) / normalizer
        let a = isAlphaSpecified ? CGFloat((rgb & componentMask) * shortToLongFormMultiplier) / normalizer
                : 1.0
        return (r, g, b, a)
    }

    private static func resolveConfiguration(of hexColor: String)
                    -> (bitsPerColorComponent: UInt32, redComponentOffset: UInt32,
                        shortToLongFormMultiplier: UInt32, isAlphaSpecified: Bool)? {
        var bitsPerColorComponent, redComponentOffset, shortToLongFormMultiplier: UInt32
        var isAlphaSpecified: Bool
        switch hexColor.count {
        case 8:
            bitsPerColorComponent = 8
            redComponentOffset = 3
            shortToLongFormMultiplier = 1
            isAlphaSpecified = true
        case 6:
            bitsPerColorComponent = 8
            redComponentOffset = 2
            shortToLongFormMultiplier = 1
            isAlphaSpecified = false
        case 4:
            bitsPerColorComponent = 4
            redComponentOffset = 3
            shortToLongFormMultiplier = 0x11
            isAlphaSpecified = true
        case 3:
            bitsPerColorComponent = 4
            redComponentOffset = 2
            shortToLongFormMultiplier = 0x11
            isAlphaSpecified = false
        default:
            return nil
        }
        return (bitsPerColorComponent, redComponentOffset, shortToLongFormMultiplier, isAlphaSpecified)
    }

    private static func isValidHexColorString(_ hexColorString: String) -> Bool {
        let hexColor = hexColorString.uppercased()
        let hexDigitRegex = "[0-9A-F]"
        let hexColorRegex: String = "#?(\(hexDigitRegex){3,4}"
                + "|\(hexDigitRegex){6}"
                + "|\(hexDigitRegex){8})"
        let test = NSPredicate(format: "SELF MATCHES %@", hexColorRegex)
        return test.evaluate(with: hexColor)
    }
}
