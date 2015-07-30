//
//  ResponseObject.swift
//  CoverFlowApp
//
//  Created by Trivedi, Astha on 29/07/15.
//  Copyright (c) 2015 Astha. All rights reserved.
//

import UIKit

class ResponseObject: NSObject {
   
    var responseData: NSData?
    var error: NSError?
    
    class func responseData(responseData: NSData?, error: NSError?) -> ResponseObject {
        
        var response:ResponseObject = ResponseObject.alloc()
        
        response.responseData = responseData
        response.error = error
        
        return response
    }
}
