//
//  SearchesMainViewController.swift
//  CLAutoPro
//
//  Created by Chris Wineland on 11/4/14.
//  Copyright (c) 2014 Chris Wineland. All rights reserved.
//

import Foundation
import UIKit

class SearchesMainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var contentTableView: UITableView?
    
    var recentSearches = [Search]()
    var savedSearches = [Search]()

     required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    internal override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.navigationItem.title = "CLAutoPro"
        
        populateTableViewData()
        
        var nib = UINib(nibName: "SingleSearchTableViewCell", bundle: nil)
        contentTableView?.registerNib(nib, forCellReuseIdentifier: SingleSearchTableViewCellController.reuseID())
    }
    
    func populateTableViewData(){
        recentSearches.append(Search())
        recentSearches.append(Search())
        
        savedSearches.append(Search())
        savedSearches.append(Search())
        savedSearches.append(Search())
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
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

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        if(indexPath.section == 0){
            return creatNewSearchCell()
        } else if(indexPath.section == 1 && savedSearches.count == 0){
            return creatNoSavedSearchCell()
        } else if(indexPath.section == 2 && recentSearches.count == 0){
            return createNoRecentSearchCell()
        } else {
            var cell : SingleSearchTableViewCellController = tableView.dequeueReusableCellWithIdentifier(SingleSearchTableViewCellController.reuseID(), forIndexPath: indexPath) as SingleSearchTableViewCellController
            cell.search = searchDataForIndexPath(indexPath)
            cell.formatCell()
            return cell
        }
    }
    
    func searchDataForIndexPath(indexPath:NSIndexPath) -> Search {
        if(indexPath.section == 1 && savedSearches.count >= indexPath.row){
            return savedSearches[indexPath.row]
        } else if(indexPath.section == 1 && recentSearches.count >= indexPath.row){
            return recentSearches[indexPath.row]
        } else {
            return Search()
        }
    }

    
    func creatNewSearchCell() -> UITableViewCell {
        var cell : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "NewSearch")
        return cell;
    }
    
    func creatNoSavedSearchCell() -> UITableViewCell {
        var cell : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "NoSaved")
        return cell;
    }
    
    func createNoRecentSearchCell() -> UITableViewCell {
        var cell : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "NoRecent")
        return cell;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        if(indexPath.section == 0){
            var createSearchVC : CreateSearchViewController = CreateSearchViewController(nibName: "CreateSearchView", bundle: nil)
            self.navigationController?.pushViewController(createSearchVC, animated: true)
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerview : UIViewController
        
        switch section {
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
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return TableViewDataBase.heightForTableViewSectionHeaders()
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return TableViewDataBase.heightForTableViewSectionFooters()
    }
}