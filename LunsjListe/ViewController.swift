//
//  ViewController.swift
//  LunsjListe
//
//  Created by Fredrick Biering on 29/08/16.
//  Copyright © 2016 Fredrick Biering. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var btn: UIButton!
    var counter = 0
    
    @IBAction func onClick(_ sender: UIButton) {
        counter = counter + 1;
        lbl.text = "\(counter)";
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

