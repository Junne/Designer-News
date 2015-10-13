//
//  MenuViewController.swift
//  DesignerNews
//
//  Created by Junne on 10/10/15.
//  Copyright © 2015 Junne. All rights reserved.
//

import UIKit
import Spring

protocol MenuViewControllerDelegate: class {
    func menuViewControllerDidTouchTop(controller: MenuViewController)
    func menuViewControllerDidTouchRecent(controller: MenuViewController)
    func menuViewControllerDidTouchLogout(controller: MenuViewController)
}

class MenuViewController: UIViewController {

    
    @IBOutlet weak var dialogView: DesignableView!
    @IBOutlet weak var loginLabel: UILabel!
    weak var delegate: MenuViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if LocalStore.getToken() == nil {
            loginLabel.text = "Login"
        } else {
            loginLabel.text = "Logout"
        }

    }

    @IBAction func closeButtonDidTouch(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        dialogView.animation = "fall"
        dialogView.animate()
        
    }
    @IBAction func topButtonDidTouch(sender: AnyObject) {
        delegate?.menuViewControllerDidTouchTop(self)
        closeButtonDidTouch(sender)
    }
    
    @IBAction func recentButtonDidTouch(sender: AnyObject) {
        delegate?.menuViewControllerDidTouchRecent(self)
        closeButtonDidTouch(sender)
    }
    
    @IBAction func loginButtonDidTouch(sender: AnyObject) {
        
        if LocalStore.getToken() == nil {
            performSegueWithIdentifier("LoginSegue", sender: self)
        } else {
            LocalStore.deleteToken()
            delegate?.menuViewControllerDidTouchLogout(self)
            closeButtonDidTouch(sender)
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
