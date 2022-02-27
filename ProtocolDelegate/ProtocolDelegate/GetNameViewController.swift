//
//  GetNameViewController.swift
//  ProtocolDelegate
//
//  Created by Julay Wang on 2/13/22.
//

import UIKit

protocol SendFirstAndLastNameDelegate {
    func setFirstNameAndLastName(firstName : String, lastName : String)
    func setWelcomeText(welcomeText : String?)
}

class GetNameViewController: UIViewController {
    
    var firstName : String?
    var lastName : String?
    
    var sendFirstAndLastNameDelegate : SendFirstAndLastNameDelegate?
    var sendMessageDelegate: SendMessageDelegate?
    
    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let firstName = firstName else {
            return
        }
        
        guard let lastName = lastName else {
            return
        }
        
        txtFirstName.text = firstName
        txtLastName.text = lastName

    }
    
    @IBAction func saveName(_ sender: Any) {
        
        guard let first = txtFirstName.text else {return}
        guard let last = txtLastName.text else {return}
        
        
        sendMessageDelegate.sendMessage(message : "Welcome! \(first) \(last)")
        
//        sendFirstAndLastNameDelegate?.setFirstNameAndLastName(firstName: first, lastName: last)
//        sendFirstAndLastNameDelegate?.setWelcomeText(welcomeText: "Welcome! \(first) \(last)")
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
