//
//  NetworkService.swift
//  CoverFlowApp
//
//  Created by Trivedi, Astha on 28/07/15.
//  Copyright (c) 2015 Astha. All rights reserved.
//

import UIKit

class NetworkService: NSObject {
    
    // MARK: Singleton Initailizer
    
    class var sharedService: NetworkService {
        struct Static {
            static let instance: NetworkService = NetworkService()
        }
        return Static.instance
    }
    
    // MARK: Network Methods
    
    func getDataForSearchTerm (searchTerm: String) -> ResponseObject {
        let searchUrlString = UrlProducer.searchUrlForTerm(searchTerm)
        
        return self.getDatafromUrl(searchUrlString)
    }
    
    
    // MARK: Network Helper Methods
 
    func getDatafromUrl(url: String) -> ResponseObject {
        
        var responseData: NSData?
        var error: NSError?
        var response:NSURLResponse?
        let inUrl:NSURL = NSURL(string: url)!
        
        let request:NSURLRequest = NSURLRequest(URL: inUrl,
                                                cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData,
                                                timeoutInterval: 100)
        
        responseData = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: &error)
        
        return ResponseObject.responseData(responseData, error: error)
    }
    
    
}
