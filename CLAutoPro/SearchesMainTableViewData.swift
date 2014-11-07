//
//  SearchesMainTableViewData.swift
//  CLAutoPro
//
//  Created by Chris Wineland on 11/5/14.
//  Copyright (c) 2014 Chris Wineland. All rights reserved.
//

import Foundation
import UIKit


class SearchesMainTableViewData : TableViewDataBase {
    
    var recentSearches = [Search]()
    var savedSearches = [Search]()
    
    override init(){
        //this should be fetching the saved searches from on device storage
        super.init()
        
        recentSearches.append(Search())
        recentSearches.append(Search())
        
        savedSearches.append(Search())
        savedSearches.append(Search())
        savedSearches.append(Search())
    }
    
    func numberOfRowsInTableSection(tableSection:Int) -> Int {  
        switch tableSection {
        case 0:
            return 1
        case 1:
            return recentSearches.count == 0 ? 1 : recentSearches.count
        case 2:
            return savedSearches.count == 0 ? 1 : savedSearches.count
        default:
            return 0
        }
    }
    
    func numberOfSectionsInTableView() -> Int {
        return 3
    }
    
    func headerViewForSection(tableSection:Int) -> UIView {
        var headerview : UIViewController
        
        switch tableSection {
        case 0:
            headerview = TextualTableSectionHeaderViewController(text: "New Search")
        case 1:
            headerview = TextualTableSectionHeaderViewController(text: "Saved Searches")
        case 2:
            headerview = TextualTableSectionHeaderViewController(text: "Recent Searches")
        default:
            headerview = TextualTableSectionHeaderViewController(text: "")
        }
        
        return headerview.view
    }
}
