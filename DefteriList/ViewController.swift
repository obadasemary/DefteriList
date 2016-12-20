//
//  ViewController.swift
//  DefteriList
//
//  Created by Abdelrahman Mohamed on 12/20/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var txtOutput: UITextView!
    
    var items:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtInput.delegate = self
    }

    @IBAction func addListAction(_ sender: Any) {
        
        guard let txt = txtInput.text, !txt.isEmpty else {
            
            let alertController = UIAlertController(title: "Oops", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        
        items.append(txt)
        
        txtOutput.text = ""
        
        for item in items {
            txtOutput.text.append("\(item)\n")
        }
        
        txtInput.text = ""
        txtInput.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        txtInput.resignFirstResponder()
        
        return false
    }
}

