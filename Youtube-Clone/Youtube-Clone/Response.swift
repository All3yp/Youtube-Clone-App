//
//  Response.swift
//  Youtube-Clone
//
//  Created by Alley Pereira on 06/08/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import Foundation


struct Response: Decodable {
    
    var items:[Video]?
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
    }
    
}
