//
//  Constants.swift
//  Youtube-Clone
//
//  Created by Alley Pereira on 05/08/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import Foundation

struct Constants {
    static var API_KEY = ""
    static var PLAYLIST_ID = "PLMRqhzcHGw1b89DXHOVA77ozWXWmuBkWX"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
