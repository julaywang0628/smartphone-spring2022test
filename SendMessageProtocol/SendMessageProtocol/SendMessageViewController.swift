//
//  SendMessageViewController.swift
//  SendMessageProtocol
//
//  Created by Julay Wang on 2/13/22.
//

import UIKit

class SendMessageViewController: UIViewController {

    @IBOutlet weak var txtWelcome: UITextField!
    
    
    var sendMessageDelegate : SendMessageDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendMessageAction(_ sender: Any) {
        
        sendMessageDelegate?.sendMessage(message: txtWelcome.text!)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
