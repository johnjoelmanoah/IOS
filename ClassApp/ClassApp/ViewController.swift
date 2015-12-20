//
//  ViewController.swift
//  ClassApp
//
//  Created by josna jose on 2015-12-19.
//  Copyright (c) 2015 Group. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ViewController: UIViewController {

    @IBOutlet var NameField: UITextField!
    @IBOutlet var PassworldField: UITextField!
    @IBOutlet var RoleField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
    }

    @IBAction func Logbtn(sender: AnyObject) {
        
        
        login()
    }
    
    
    func login()
    {
        
        let user = PFUser()
        
        user.username = NameField.text
        
        user.password = PassworldField.text
        
        PFUser.logInWithUsernameInBackground(NameField.text, password: PassworldField.text, block: {
            (User : PFUser?, Error : NSError?) -> Void in
            if Error == nil{
                
                dispatch_async(dispatch_get_main_queue())
                    {
                        var Storyboard = UIStoryboard(name: "Main", bundle: nil)
                        var MainVC : UIViewController = Storyboard.instantiateViewControllerWithIdentifier("MainVC") as!
                        UIViewController
                        self.presentViewController(MainVC, animated: true, completion: nil)
                }
            }
            else{
                NSLog("wrong!!")
                
            }
            
            
        })
        
    }

    @IBAction func Signbtn(sender: AnyObject) {
    
        signup()
        
    }
    func signup()
    {
        
        let user = PFUser()
        
        user.username = NameField.text
        
        user.password = PassworldField.text
        user.setObject(RoleField.text, forKey: "Role")
        
        // user.addObject(roleField.text, forKey: "Role")
        user.saveInBackground()
        
        // other fields can be set if you want to save more information
        
        user.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if error == nil {
                // Hooray! Let them use the app now.
            }
            else {
                // Examine the error object and inform the user.
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

