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

    @NSManaged var artistId: NSNumber
    @NSManaged var collectionId: NSNumber
    @NSManaged var trackId: NSNumber
    @NSManaged var artistName: String
    @NSManaged var collectionName: String
    @NSManaged var trackName: String
    @NSManaged var trackImage: NSData

}
