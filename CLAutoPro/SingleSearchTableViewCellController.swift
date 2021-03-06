//
//  SingleSearchTableViewCellController.swift
//  CLAutoPro
//
//  Created by Chris Wineland on 11/9/14.
//  Copyright (c) 2014 Chris Wineland. All rights reserved.
//

import Foundation
import UIKit
class SingleSearchTableViewCellController : UITableViewCell {
    
    @IBOutlet var dateMonthLable : UILabel?
    @IBOutlet var dateDayLable : UILabel?
    @IBOutlet var yearLable : UILabel?
    @IBOutlet var makeModelLable : UILabel?
    
    var search : Search = Search()
    
    class func reuseID() -> String{
        return "SingleSearchTableViewCell"
    }
    
    
    func formatCell(){
        formatDateMonthLable()
        formatDateDayLable()
        formatYearRangeLable()
        formatMakeModelLable()
    }
    
    private func formatDateMonthLable(){
        
    }
    
    private func formatDateDayLable(){
        
    }
    
    private func formatYearRangeLable(){
        
    }
    
    private func formatMakeModelLable(){
        
    }
}