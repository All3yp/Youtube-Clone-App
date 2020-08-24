//
//  VideoTableViewCell.swift
//  Youtube-Clone
//
//  Created by Alley Pereira on 08/08/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var thumbnailImmageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video) {
        self.video = v
        
        //Ensure that we have a video
        guard self.video != nil else {
            return
        }
        
        // Set the title label
        self.titleLabel.text = video?.title
        
        // Set the date label
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // Set the thumbnail
        guard self.video!.thumbail != "" else {
            return
        }
        
        // Check cache before downloading data
        if let cacheData = CacheManager.getVideoCache(self.video!.thumbail) {
            
            // Set the thumbnail imageview
            self.thumbnailImmageView.image = UIImage(data: cacheData)
            return
        }
        
        // Download the thumbnail data
        let url = URL(string: self.video!.thumbail)
        
        // Get the shared URLSession object
        let session = URLSession.shared
        
        //Create a data task
        let dataTask = session.dataTask(with: url!) {(data, response, error) in
            
            if error == nil && data != nil {
                
                // Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                // Check that the downloaded url matches the video thumbail url  that this cell is currently set to display
                if url!.absoluteString != self.video?.thumbail {
                    
                    // Video cell has been recycled for another video and no longer matches the thumbail that was downloaded
                    return
                }
                
                // Create the image object
                let image = UIImage(data: data!)
                
                //Set the imageView
                DispatchQueue.main.async {
                    self.thumbnailImmageView.image = image
                }
            }
            
        }
        // start datatask
        dataTask.resume()
    }
    
}
