//
//  ViewController.swift
//  Youtube-Clone
//
//  Created by Alley Pereira on 05/08/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

