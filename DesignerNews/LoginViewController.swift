//
//  LoginViewController.swift
//  DesignerNews
//
//  Created by baijf on 9/28/15.
//  Copyright © 2015 Junne. All rights reserved.
//

import UIKit
import Spring

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var dialogView: DesignableView!
    @IBOutlet weak var emailImageView: SpringImageView!
    @IBOutlet weak var passwordImageView: SpringImageView!
    @IBOutlet weak var emailTextField: DesignableTextField!
    @IBOutlet weak var passwordTextField: DesignableTextField!
    @IBAction func closeButtonDidTouch(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func loginButtonDidTouch(sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField == emailTextField {
            emailImageView.image = UIImage(named: "icon-mail-active")
            emailImageView.animate()
        } else {
            emailImageView.image = UIImage(named: "icon-mail")
        }
        
        if textField == passwordTextField {
            passwordImageView.image = UIImage(named: "icon-password-active")
            passwordImageView.animate()
        } else {
            passwordImageView.image = UIImage(named: "icon-password")
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        emailImageView.image = UIImage(named: "icon-mail")
        passwordImageView.image = UIImage(named: "icon-password")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
