//
//  ViewController.swift
//  ViewControllerLifeCycle1
//
//  Created by Nagarajan on 8/27/14.
//  Copyright (c) 2014 Nagarajan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder);
        print("%s", #function);
        print("Unarchive data from nib or storyboard\n\n")
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("%s", #function);
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        print("%s", #function);
        print("Prepares the receiver for service after it has been loaded from an Interface Builder archive, or nib file\n\n")
    }
    
    override func loadView()
    {
        super.loadView()
        print("%s", #function);
        print("You should never call this method directly. The view controller callls this method when its view property is requested but is currently nil. This method loads or creates a view and asigns in to the view property\n\n")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("%s", #function);
        print("This method is called after the view controller has loaded its view hierarchy into memory\n\n")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("%s", #function);
    }
}

