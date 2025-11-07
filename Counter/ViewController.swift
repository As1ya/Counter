//
//  ViewController.swift
//  Counter
//
//  Created by Анастасия Федотова on 07.11.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var NumberUILabel: UILabel!
    
    @IBOutlet weak var ChangeNumber: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NumberUILabel.text = "0"
    }

    private var number: Int = 0
    
    
    @IBAction func DidTabButton(_ sender: Any) {
        number += 1
        NumberUILabel.text = String(number)
    }
    
}

