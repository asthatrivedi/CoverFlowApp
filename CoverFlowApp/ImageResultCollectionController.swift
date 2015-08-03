//
//  ImageResultViewController.swift
//  CoverFlowApp
//
//  Created by Trivedi, Astha on 28/07/15.
//  Copyright (c) 2015 Astha. All rights reserved.
//

import UIKit

class ImageResultCollectionController: UICollectionViewController {

    var albums: NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.albums = ITunesService.sharedService.getAlbumInfoFromCoreData()
        
        self.collectionView?.registerNib(UINib(nibName: "ImageResultCollectionCell",
                                         bundle: nil),
                                         forSupplementaryViewOfKind: "Title",
                                         withReuseIdentifier:"ImageCell");
        
    }
    
    // MARK: UICollectionView Datasource methods
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.albums!.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell: ImageResultCollectionCell = self.collectionView?.dequeueReusableCellWithReuseIdentifier("ImageCell", forIndexPath: indexPath) as! ImageResultCollectionCell
        
        let albumInfo: AlbumInfo = self.albums!.objectAtIndex(indexPath.row) as! AlbumInfo
        
        cell.backgroundColor = UIColor.clearColor()
        cell.setImageWithUrl(albumInfo.trackImageUrl)
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        var cell: ImageTitleReusableView = self.collectionView?.dequeueReusableCellWithReuseIdentifier("Title", forIndexPath: indexPath) as! ImageTitleReusableView
        
        return cell
    }
    
}

