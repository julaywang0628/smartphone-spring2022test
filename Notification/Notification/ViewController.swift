//
//  ViewController.swift
//  Notification
//
//  Created by Julay Wang on 2/13/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblFirstName: UILabel!
    
    @IBOutlet weak var lblLastName: UILabel!
    
    
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeToNotifications()
    }

    @IBAction func gotoProfile(_ sender: Any) {
        performSegue(withIdentifier: "segueProfile", sender: self)
    }
    
    @IBAction func gotoFormEntry(_ sender: Any) {
        performSegue(withIdentifier: "segueFormEntry", sender: self)
    }
    
    func subscribeToNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(getFirstName), name: nameNotif, object: nil)
    }
    
    @objc func getFirstName(notif : NSNotification){
        print("I am here")
        if let dict = notif.userInfo as NSDictionary? {
            
            if let firstName = dict["FirstName"] as? String {
                lblFirstName.text = firstName
            }
            
            if let lastName = dict["LastName"] as? String {
                lblLastName.text = lastName
            }
        }
    }
}

