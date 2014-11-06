//
//  TextualTableSectionHeaderViewController.swift
//  CLAutoPro
//
//  Created by Chris Wineland on 11/6/14.
//  Copyright (c) 2014 Chris Wineland. All rights reserved.
//

import Foundation
import UIKit

class TextualTableSectionHeaderViewController : UIViewController {
    
    @IBOutlet var headerLable : UILabel?
    var lableText = String()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    internal override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    init(text : String){
        super.init(nibName: "TextualTableSectionHeaderView", bundle: nil)
        lableText = text
    }
    
    override func viewDidLoad() {
        headerLable?.text = lableText
    }

}
