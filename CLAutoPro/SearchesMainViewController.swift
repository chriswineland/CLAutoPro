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
    var tableViewData = SearchesMainTableViewData()
     required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    internal override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.navigationItem.title = "Search"
        
        var nib = UINib(nibName: "SingleSearchTableViewCell", bundle: nil)
        contentTableView?.registerNib(nib, forCellReuseIdentifier: SingleSearchTableViewCellController.reuseID())
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return tableViewData.numberOfSectionsInTableView()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.numberOfRowsInTableSection(section)
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        if(indexPath.section == 0){
            return creatNewSearchCell()
        } else if(indexPath.section == 1 && tableViewData.shouldDisplaySavedSearchesPlaceholder()){
            return creatNoSavedSearchCell()
        } else if(indexPath.section == 2 && tableViewData.shouldDisplayRecentSearchesPlaceholder()){
            return createNoRecentSearchCell()
        } else {
            var cell : SingleSearchTableViewCellController = tableView.dequeueReusableCellWithIdentifier(SingleSearchTableViewCellController.reuseID(), forIndexPath: indexPath) as SingleSearchTableViewCellController
            cell.search = tableViewData.searchDataForIndexPath(indexPath)
            cell.formatCell()
            return cell
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
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableViewData.headerViewForSection(section)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableViewData.heightForTableViewSectionHeaders()
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return tableViewData.heightForTableViewSectionFooters()
    }
}