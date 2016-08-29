//
//  ViewController.swift
//  LunsjListe
//
//  Created by Fredrick Biering on 29/08/16.
//  Copyright © 2016 Fredrick Biering. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weekdayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    
    @IBAction func onClick(_ sender: UIButton) {
        warningLabel.isHidden = true
        
        let username = usernameTextfield.text
        let valid = validateUsername(username: username)
        
        if (valid) {
            sender.backgroundColor = UIColor.darkGreen()
            sender.isEnabled = false
        } else {
            warningLabel.isHidden = false
        }
        
        print("valid is: \(valid)")
    }
    
    func validateUsername(username: String?) -> Bool {
        return !username!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

