//
//  ViewController.swift
//  Youtube-Clone
//
//  Created by Alley Pereira on 05/08/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set itself as the datasource and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set itself as the delegate of the model
        model.delegate = self
        
        model.getVideos()
    }
    
    //MARK: - Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        
        // Set returned videosto to our video property
        self.videos = videos
        
        // Refresh tableView
        tableView.reloadData()
    }
    
    //MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        // Configure the cell  with the data
        let video = self.videos[indexPath.row]
        
        /*Get the title for the video in question
        cell.textLabel?.text = title */
 
        cell.setCell(video)
        
        // Return the cell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

