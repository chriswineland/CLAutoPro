//
//  CreateSearchTableHeaderViewController.swift
//  CLAutoPro
//
//  Created by Chris Wineland on 11/12/14.
//  Copyright (c) 2014 Chris Wineland. All rights reserved.
//

import Foundation
import UIKit

class CreateSearchTableHeaderViewController: UIViewController {
    @IBOutlet var headerLable : UILabel?
    @IBOutlet var submitButton : UIButton?
    
    var lableText = String()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    internal override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    init(text : String){
        super.init(nibName: "CreateSearchTableHeaderView", bundle: nil)
        lableText = text
    }
    
    override func viewDidLoad() {
        headerLable?.text = lableText
    }
}
