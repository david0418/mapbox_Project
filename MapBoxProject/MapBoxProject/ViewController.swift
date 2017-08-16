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

    // Adding Mapbox
    let map = MGLMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = map
        
        var data = readDataFromCSV(name: "food", type: "csv")
        data = cleanRows(file: data)
        let csvRows = csv(data: data)
        print(csvRows)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func readDataFromCSV(name: String, type: String) -> String {
        
        let filepath = Bundle.main.path(forResource: name, ofType: type)
        
        if let file = filepath {
            
            do {
                var contents = try String(contentsOfFile: file)
                contents = cleanRows(file: contents)
                
                return contents
                
            } catch {
                print("File Read Error for file error")
            }
        
        }
        return ""
    }
    
    func cleanRows(file: String) -> String {
        
        var cleanFile = file
        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
        
        return cleanFile
    }
    
    
    func csv(data: String) -> [[String]] {
        
        var result: [[String]] = []
        let rows = data.components(separatedBy: "\n")
        for row in rows {
            let columns = row.components(separatedBy: ";")
            result.append(columns)
            
        }
        return result
    }
}



// Error Handling
enum CSVFileError: Error {
    
    case missingResource
}

