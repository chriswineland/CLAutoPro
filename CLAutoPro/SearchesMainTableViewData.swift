//
//  SearchesMainTableViewData.swift
//  CLAutoPro
//
//  Created by Chris Wineland on 11/5/14.
//  Copyright (c) 2014 Chris Wineland. All rights reserved.
//

import Foundation


class SearchesMainTableViewData {
    
    var recentSearches = [Search]()
    var savedSearches = [Search]()
    
    init() {
        //this should be fetching the saved searches from on device storage
        
        recentSearches.append(Search())
        recentSearches.append(Search())
        
        savedSearches.append(Search())
        savedSearches.append(Search())
        savedSearches.append(Search())
    }
    
    func numberOfRowsInTableSection(tableSection:Int) -> Int {
        switch tableSection{
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
}
