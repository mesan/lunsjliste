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
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBAction func onValueChanged(_ sender: UIDatePicker) {
        // TODO Check if the user has already signed up for lunch on the current date
        let dateToCheck = sender.date
        
        Logger.printDebug("dateToCheck:", dateToCheck)
        
    }
    
    @IBAction func onClick(_ sender: UIButton) {
        warningLabel.isHidden = true
        
        let username = usernameTextfield.text
        let valid = validateUsername(username)
        
        Logger.printDebug(datepicker.date)
        
        if (valid) {
            sender.backgroundColor = UIColor.darkGreen()
            sender.isEnabled = false
            
            // TODO call external service which signs up user for lunch if
            // they are not already signed up
            
        } else {
            warningLabel.isHidden = false
        }
    }
    
    func validateUsername(_ username: String?) -> Bool {
        return !username!.isEmpty
    }
    
    /**
     Sets up the datepicker to allow user to sign up either today or
     X amount of days into the future.
     */
    func setupDatepicker() {
        let todaysDate = Date.init()
        
        let maxDate = Calendar.current.date(byAdding: .day, value: Constants.DateSignupRestrictions.MAXIMUM_AMOUNT_OF_DAYS_IN_FUTURE_FOR_SIGNUP, to: todaysDate)
        
        datepicker.maximumDate = maxDate
        datepicker.minimumDate = todaysDate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDatepicker();
        // Do any additional setup after loading the view, typically from a nib.
    }
}

