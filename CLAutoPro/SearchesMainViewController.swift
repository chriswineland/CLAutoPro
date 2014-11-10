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
        self.contentTableView?.registerNib(UINib(nibName: "SingleSearchTableViewCell", bundle: nil), forCellReuseIdentifier: SingleSearchTableViewCellController.reuseID())
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return tableViewData.numberOfSectionsInTableView()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.numberOfRowsInTableSection(section)
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell : SingleSearchTableViewCellController = tableView.dequeueReusableCellWithIdentifier(SingleSearchTableViewCellController.reuseID(), forIndexPath: indexPath) as SingleSearchTableViewCellController
        cell.formatCell()
        return cell
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