//
//  ImageResultCollectionCell.swift
//  CoverFlowApp
//
//  Created by Trivedi, Astha on 01/08/15.
//  Copyright (c) 2015 Astha. All rights reserved.
//

import UIKit

class ImageResultCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView?
    var imageUrl: NSString?
    
    func setImageWithUrl(imageUrl: NSString?) {
        image?.image = ITunesService.sharedService.getImageForUrl(imageUrl as! String)
    }
}
