//
//  ViewController.swift
//  MapBoxProject
//
//  Created by Courtney Osborne on 8/15/17.
//  Copyright © 2017 Courtney Osborne. All rights reserved.
//

import UIKit
import Mapbox

class ViewController: UIViewController {

    let map = MGLMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = map
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

