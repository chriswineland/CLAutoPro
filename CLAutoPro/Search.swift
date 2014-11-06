//
//  Search.swift
//  CLAutoPro
//
//  Created by Chris Wineland on 11/5/14.
//  Copyright (c) 2014 Chris Wineland. All rights reserved.
//

import Foundation

class Search{
    
    var creationDate = NSDate()
    var lastQuieryDate = NSDate()
    //required
    var location = [String]()
    var make, model : String?
    //optional
    var yearMin, yearMax, priceMin, priceMax, milesMin, milesMax : Int?
    var color : String?
    var transmission, hasImage, hasTitle : Bool?
    
    init() {
        
    }
    
    func isValidSearch() -> Bool{
        return location.count > 0 && make != nil && model != nil
    }
    
    func quieryString() -> String{
        return ""
    }
    
}
