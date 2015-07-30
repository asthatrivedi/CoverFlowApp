//
//  UrlProducer.swift
//  CoverFlowApp
//
//  Created by Trivedi, Astha on 29/07/15.
//  Copyright (c) 2015 Astha. All rights reserved.
//

import UIKit

class UrlProducer: NSObject {

    static let baseUrl = "https://itunes.apple.com"
    static let searchMethod = "search"
    static let term = "term"
    
    class func searchUrlForTerm (searchTerm: String) -> String {
        
        let newString = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+")
        return String(format: "%@/%@?%@=%@", baseUrl, searchMethod, term, newString)
    }
}
