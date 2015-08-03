//
//  ITunesService.swift
//  CoverFlowApp
//
//  Created by Trivedi, Astha on 29/07/15.
//  Copyright (c) 2015 Astha. All rights reserved.
//

import UIKit
import CoreData

class ITunesService: NSObject {
   
    var managedObjectContext: NSManagedObjectContext?
    
    class var sharedService: ITunesService {
        struct Static {
            static let instance: ITunesService = ITunesService()
        }
        return Static.instance
    }
    
    func loadArtistDataWithName(artistName: String) {
        
        let response:ResponseObject = NetworkService.sharedService.getDataForSearchTerm(artistName)
        var parseError: NSError?
        var resultArray: NSMutableArray = NSMutableArray()
        
        let parsedObject: AnyObject? = NSJSONSerialization.JSONObjectWithData(response.responseData!,
                                                             options: NSJSONReadingOptions.AllowFragments,
                                                             error: &parseError)
        if let results = parsedObject as? NSDictionary {
            for (result, albums) in results {
                if let albumList = albums as? NSArray {
                    for album in albumList {
                        var albumInfo = AlbumInfo.getAlbumInfoFromDictionary(album as! NSDictionary,
                                                                             managedObjectContext: self.managedObjectContext!)
                        resultArray.addObject(AlbumInfo)
                    }
                }
            }
        }
        
        var error: NSError?
        
        self.managedObjectContext?.save(&error)
        
        if error != nil {
            NSLog("no data gathered")
        }
        else {
            NSLog("success")
        }
    }
    
    func getAlbumInfoFromCoreData() -> NSArray {
        
        var error: NSError?
        var request: NSFetchRequest = NSFetchRequest(entityName: "AlbumInfo")
        
        var result: [AlbumInfo] = [AlbumInfo]()
        
        result = self.managedObjectContext!.executeFetchRequest(request, error: &error) as! [AlbumInfo]
        
        var albums: NSMutableArray = NSMutableArray()
        
        if (error == nil) {
            
            for fetchedObject in result {
                albums.addObject(fetchedObject)
            }
        }
        
        return albums
    }
    
    func getImageForUrl(url: NSString) -> UIImage? {
        let response = NetworkService.sharedService.getDatafromUrl(url as String)
        
        return UIImage(data: response.responseData!)
    }
}
