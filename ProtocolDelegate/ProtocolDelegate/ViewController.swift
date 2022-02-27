//
//  ViewController.swift
//  ProtocolDelegate
//
//  Created by Julay Wang on 2/13/22.
//

import UIKit

class ViewController: UIViewController, SendFirstAndLastNameDelegate, SendMessageDelegate {
    
    
    @IBOutlet weak var lblFirstName: UILabel!
    
    @IBOutlet weak var lblLastName: UILabel!
    
    @IBOutlet weak var lblWelcome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getNameFromUser(_ sender: Any) {
        performSegue(withIdentifier: "segueGetName", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueGetName" {
            let getNameVC = segue.destination as! GetNameViewController
            
            guard let firstName = lblFirstName.text else {return}
            guard let lastName = lblLastName.text else {
                return
            }
            
            getNameVC .firstName = firstName
            getNameVC.lastName = lastName
            
            getNameVC.sendMessageDelegate = self
        }
    }
    
    func setFirstNameAndLastName(firstName: String, lastName: String) {
        lblFirstName.text = firstName
        lblLastName.text = lastName
    }
    
    func setWelcomeText(welcomeText: String?) {
        lblWelcome.text = welcomeText
    }
    
    func sendMessage(message : String) {
        print(message)
        lblWelcome.text = message
    }
}

