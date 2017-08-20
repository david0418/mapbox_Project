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

    var results = [[String]]()
    
    // Adding Mapbox
    let map = MGLMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = map
        
        let data = readDataFromCSV(name: "food", type: "csv")
        let _ = csv(data: data)
//        print(csvRows[1])
        
    }

    func readDataFromCSV(name: String, type: String) -> String {
        
        let filepath = Bundle.main.path(forResource: name, ofType: type)
        
        if let file = filepath {
            
            do {
                let contents = try String(contentsOfFile: file)
                
                return contents
                
            } catch {
                print("File Read Error for file error")
            }
        
        }
        return ""
    }
    
    func cleanRows(file: String) -> String {
        
        let cleanFile = file
        
        return cleanFile
    }
    
    func csv(data: String) -> [[String]] {
        
        let rows = data.components(separatedBy: "\n")
        
     //Trims the strings
        for row in rows {
        
            let trim = row.trimmingCharacters(in: .newlines)
            let atring = String(trim)
            let replaceString = atring?.replacingOccurrences(of: "\"", with: "", options: .literal, range: nil)
            let removeComma = replaceString?.replacingOccurrences(of: "'", with: "", options: .literal, range: nil)
            let removeSemi = removeComma?.replacingOccurrences(of: ";", with: " ", options: .literal, range: nil)
            let remove = removeSemi?.replacingOccurrences(of: ",", with: " ", options: .literal, range: nil)

            let g = remove?.components(separatedBy: " ")
            
//            if let list = g {
//                if list.count > 6 {
//                    
//                let removal = list[3...6]
//                    
//                let join = removal.joined(separator: " ")
//                    print(join)
//                    
//                }
//            }
            
            results.append(g!)
        }
    
        var count = 0
        
        for result in self.results {
            
            count += 1
            
            if count == self.results.count {
                break
            }
            
//            let idTag = result[0]
//            let lat = result[1]
//            let long = result[2]
//            let name = result[3]
//            let amenity = result[4]
            
//            print(amenity)
        }
        return results
    }
}


// Error Handling
enum CSVFileError: Error {
    
    case missingResource
}

