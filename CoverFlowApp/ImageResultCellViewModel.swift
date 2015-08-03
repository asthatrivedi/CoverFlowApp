//
//  ImageResultCellViewModel.swift
//  CoverFlowApp
//
//  Created by Trivedi, Astha on 02/08/15.
//  Copyright (c) 2015 Astha. All rights reserved.
//

import UIKit

class ImageResultCellViewModel: NSObject {
   
    var imageURL: NSString?
    
    init(imageResultUrl: NSString) {
        self.imageURL = imageResultUrl
    }
}
