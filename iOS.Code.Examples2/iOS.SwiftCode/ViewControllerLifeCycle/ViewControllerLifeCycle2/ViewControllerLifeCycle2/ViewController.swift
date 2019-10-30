//
//  ViewController.swift
//  ViewControllerLifeCycle2
//
//  Created by Nagarajan on 8/27/14.
//  Copyright (c) 2014 Nagarajan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var button1: UIButton?
    
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
        
        let myView = View(frame: self.view.bounds)
        self.view.addSubview(myView)
    
        
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        button.setTitle("TaggleView", for:UIControlState())
        button.addTarget(self, action: #selector(ViewController.pressed(_:)), for: .touchUpInside)
        self.view.addSubview(button)
        
        button1 = UIButton()
        button1!.frame = CGRect(x: 50, y: 50, width: 100, height: 50)
        button1!.setTitle("DingDong", for:UIControlState())
        button1!.addTarget(self, action: #selector(ViewController.pressedDingDong(_:)), for: .touchUpInside)
        self.view.addSubview(button1!)
        
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
    
    func pressed(_ sender: UIButton!)
    {
        self.view.isHidden = true;
        self.view.removeFromSuperview()
    }

    func pressedDingDong(_ sender: UIButton!)
    {
//        self.view.hidden = true;
        self.button1!.removeFromSuperview()
    }

    // Called when the view is about to made visible. Defaults does nothing
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        print("%s", #function);
        print("This method is called before the receiver's view is about to be added to a view herarchy and before any animations are configured for showing the view.\n\n")
    }
    
    // Called when the view has been fully transistioned onto the screen. Defaults does nothing
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        print("%s", #function);
        print("Notifies the view controller thats its view was added to a view hierarchy. You can override this method to perform additional tasks associated with presenting the view. \n \n")
    }
    
    // Called when the view is dismissed, covered or otherwise hidden. Default does nothing
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        print("%s", #function);
        print("Notify the view controller that its view is about to be removed from a view hierarchy. This method is called in response to a view being removed from a view hierarchy. This method is called before the view is actually removed and before any animations are configured.\n\n")
    }
    
    // Called after the view was dismissed, covered or otherwise hidden. Default does nothing
    override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(animated)
        print("%s", #function);
        print("Notifies the view controller that its view was removed from the view hierarchy \n\n")
    }
    
    override func viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews()
        print("%s", #function);
        print("Called to notify the view controller that its view is about to layout its subviews. When a view's bounds change, the view adjusts the posistion of its subviews. Your view controlller can override this method to make changes before the view lays out its subviews. \n\n")
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        print("%s", #function);
        print("Called to notify the view controller that its view has just laid out its subviews. When the bounds change for a view controller’s view, the view adjusts the positions of its subviews and then the system calls this method. However, this method being called does not indicate that the individual layouts of the view’s subviews have been adjusted. Each subview is responsible for adjusting its own layout.\n\n")
    }
}

