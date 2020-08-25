//
//  DetailViewController.swift
//  Youtube-Clone
//
//  Created by Alley Pereira on 24/08/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    
    var video:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Clear the fields
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        
        
        // Check if there's a video
        guard video != nil else {
            return
        }
        
        //Create the embed URL
        let embedURLString = Constants.YT_EMBED_URL + video!.videoId
        
        // Load it into the webview
        let url = URL(string: embedURLString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        // Set the title
        titleLabel.text = video!.title
        
        // Set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        //Set the description
        textView.text = video!.description
    }
    
}
