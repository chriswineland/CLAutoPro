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
    var locations = [String]()
    var make, model : String?
    //optional
    var yearMin, yearMax, priceMin, priceMax, milesMin, milesMax : Int?
    var color : String?
    var transmission, hasImage, hasTitle : Bool?
    //molded data
    var quieryStrings = [String]()
    
    init(){
        
    }
    
    func isValidSearch() -> Bool{
        return locations.count > 0 && make != nil && model != nil
    }
    
    private func appendLocationToQuierySting(quieryString : String){
        
    }
}
