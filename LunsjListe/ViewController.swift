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
    
    @IBAction func onClick(_ sender: UIButton) {
        sender.backgroundColor = UIColor.green
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

