//
// Created by Vlad Zamskoi on 3/4/19.
// Copyright (c) 2019 MobileAppSoft. All rights reserved.
//

import Foundation
import UIKit

extension URL {
    private var httpScheme: String {
        return "http"
    }

    private var httpsScheme: String {
        return "https"
    }

    public func convertedToHttps() -> URL {
        guard let httpURL: String = !isHttps()
                ? absoluteString
                : nil else {
            return self
        }
        let httpsURL = httpURL.replacingOccurrences(of: httpScheme, with: httpsScheme)
        guard let resultURL = URL.init(string: httpsURL) else {
            fatalError("\(#function): URL is unexpectedly invalid after being produced based on another valid URL")
        }
        return resultURL
    }

    public func isHttps() -> Bool {
        return absoluteString.starts(with: httpsScheme)
    }

    public func isHttp() -> Bool {
        return absoluteString.starts(with: httpScheme)
    }
}
