//
//  CacheManager.swift
//  Youtube-Clone
//
//  Created by Alley Pereira on 24/08/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url: String, _ data: Data?) {
        
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        
        // Try to get the data for the specified url
        return cache[url]
    }
}
