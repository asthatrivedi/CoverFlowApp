//
//  AlbumInfo.swift
//  CoverFlowApp
//
//  Created by Trivedi, Astha on 28/07/15.
//  Copyright (c) 2015 Astha. All rights reserved.
//

import Foundation
import CoreData

class AlbumInfo: NSManagedObject {
    
    // MARK: Album Info Keys
    
    static let artistIdKey = "artistId"
    static let colectionIdKey = "collectionId"
    static let trackIdKey = "trackId"
    static let artistNameKey = "artistName"
    static let collectionNameKey = "collectionName"
    static let trackNameKey = "trackName"
    static let trackImageUrlKey = "artworkUrl100"

    @NSManaged var artistId: NSNumber
    @NSManaged var collectionId: NSNumber
    @NSManaged var trackId: NSNumber
    @NSManaged var artistName: String
    @NSManaged var collectionName: String
    @NSManaged var trackName: String
    @NSManaged var trackImageUrl: String
    
    
    class func getAlbumInfoFromDictionary(albumInfoDict: NSDictionary, managedObjectContext: NSManagedObjectContext) -> AlbumInfo {
        
        let album = NSEntityDescription.insertNewObjectForEntityForName("AlbumInfo",
                                                                        inManagedObjectContext: managedObjectContext) as! AlbumInfo
        
        album.artistId = albumInfoDict[artistIdKey] as! NSNumber
        album.collectionId = albumInfoDict[colectionIdKey] as! NSNumber
        album.trackId = albumInfoDict[trackIdKey] as! NSNumber
        album.artistName = albumInfoDict[artistNameKey] as! String
        album.collectionName = albumInfoDict[collectionNameKey] as! String
        album.trackName = albumInfoDict[trackNameKey] as! String
        album.trackImageUrl = albumInfoDict[trackImageUrlKey] as! String
        
        return album
    }
}
