//
//  ViewController.swift
//  Counter
//
//  Created by Анастасия Федотова on 07.11.2025.
//
import UIKit

final class CounterViewController: UIViewController {
    
    @IBOutlet private weak var incrementButton: UIButton!
    @IBOutlet private weak var decrementButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var historyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = "0"
        historyTextView.text = "История изменений"
        incrementButton.tintColor = .systemRed
        decrementButton.tintColor = .systemBlue
    }
    
    private var isFirstAction = true
    private var number: Int = 0
    
    @IBAction private func increaseNumber(_ sender: Any) {
        number += 1
        numberLabel.text = String(number)
        addHistoryEntry("значение изменено на +1")
    }
    
    @IBAction private func decreaseNumber(_ sender: Any) {
        if number > 0 {
            number -= 1
            numberLabel.text = String(number)
            addHistoryEntry("значение изменено на -1")
        } else {
            addHistoryEntry("попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction private func resetNumber(_ sender: Any) {
        number = 0
        numberLabel.text = "0"
        addHistoryEntry("значение сброшено")
    }
    
}

private extension CounterViewController {
    func addHistoryEntry(_ text: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let time = formatter.string(from: Date())
        if isFirstAction {
            historyTextView.text = ""
            isFirstAction = false
        }
        historyTextView.text = "[\(time)] \(text)\n" + historyTextView.text
    }
}
