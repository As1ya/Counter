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
    
    @IBOutlet weak var MinusNumber: UIButton!
    
    @IBOutlet weak var RestartUIButton: UIButton!
    
    @IBOutlet weak var HistoryUITextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NumberUILabel.text = "0"
        HistoryUITextView.text = "История изменений"
        ChangeNumber.tintColor = .systemRed
        MinusNumber.tintColor = .systemBlue
    }
    
  

    private var number: Int = 0
    private var isFirstAction = true
    
    private func AddHistoryChanges(_ text: String){
        let foramatter = DateFormatter()
        foramatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let time = foramatter.string(from: Date())
        
        if isFirstAction {
            HistoryUITextView.text = ""
            isFirstAction = false
        }
        
        HistoryUITextView.text = "[\(time)] \(text)\n " + HistoryUITextView.text
    }
    
    @IBAction func DidTabButton(_ sender: Any) {
        number += 1
        NumberUILabel.text = String(number)
        
        AddHistoryChanges("значение изменено на +1")
    }
    
    @IBAction func DidTabCancel(_ sender: Any) {
        if number > 0 {
            number -= 1
            NumberUILabel.text = String(number)
            AddHistoryChanges("значение изменено на -1")
        } else {
            AddHistoryChanges("попытка уменьшить значение счётчика ниже 0")
        }
        
    }
    
    @IBAction func RestartNumber(_ sender: Any) {
        number = 0
        NumberUILabel.text = "0"
        AddHistoryChanges("значение сброшено")
    }
    
}

