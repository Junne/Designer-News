//
//  LearnViewController.swift
//  DesignerNews
//
//  Created by Junne on 10/12/15.
//  Copyright © 2015 Junne. All rights reserved.
//

import UIKit
import Spring

class LearnViewController: UIViewController {
    
    @IBOutlet weak var dialogView: DesignableView!
    @IBOutlet weak var bookImageView: SpringImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        dialogView.animate()
    }
    
    @IBAction func learnButtonDidTouch(sender: AnyObject) {
        bookImageView.animation = "pop"
        bookImageView.animate()
        openUrl("http://designcode.io")
        
    }
    
    
    @IBAction func twitterButtonDidTouch(sender: AnyObject) {
        openUrl("http://twitter.com/MengTo")
    }
    
    @IBAction func closeButtonDidTouch(sender: AnyObject) {
        dialogView.animation = "fall"
        dialogView.animateNext { () -> () in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    func openUrl(url: String) {
        let targetURL = NSURL(string: url)
        UIApplication.sharedApplication().openURL(targetURL!)
    }
    

}
