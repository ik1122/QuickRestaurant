//
//  LoginViewController.swift
//  ChOrganizeApp
//
//  Created by Hana on 11/8/17.
//  Copyright © 2017 Pusheen Code. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func moveToToDo(_ sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let TabBarVC = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        let NavBarVC = storyboard.instantiateViewController(withIdentifier: "NavBarController") as! UINavigationController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        
        //appDelegate.window?.rootViewController = TabBarVC
        appDelegate.window?.rootViewController = NavBarVC
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
