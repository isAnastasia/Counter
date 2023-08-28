//
//  ViewController.swift
//  Counter
//
//  Created by Anastasia Gorbunova on 27.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var increaseButton: UIButton!
    
    @IBOutlet weak var decreaseButton: UIButton!
    
    @IBOutlet weak var resetToZeroButton: UIButton!
    
    @IBOutlet weak var counterView: UILabel!
    
    @IBOutlet weak var historyTextView: UITextView!
    private var countNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = UIImage(systemName: "plus") {
            increaseButton.setTitle("", for: .normal)
            increaseButton.setImage(image, for: .normal)
        }
        increaseButton.tintColor = .red
        
        if let image = UIImage(systemName: "minus") {
            decreaseButton.setTitle("", for: .normal)
            decreaseButton.setImage(image, for: .normal)
        }
        decreaseButton.tintColor = .blue
        
        if let image = UIImage(systemName: "arrow.counterclockwise") {
            resetToZeroButton.setTitle("", for: .normal)
            resetToZeroButton.setImage(image, for: .normal)
        }
        counterView.text = "\(countNumber)"
        
        historyTextView.text += "\n"
        historyTextView.isEditable = false
        
    }
    
    private func updateCounterView(message: String) {
        counterView.text = "\(countNumber)"
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, H:mm:ss"
        historyTextView.text += " \(dateFormatter.string(from: Date())): "
        historyTextView.text += message + "\n"
        
        let bottom = NSMakeRange(historyTextView.text.count - 1, 1)
        historyTextView.scrollRangeToVisible(bottom)
    }
    
    @IBAction func increaseButtonPressed(_ sender: Any) {
        countNumber += 1
        updateCounterView(message: "значение изменено на +1")
    }
    
    @IBAction func decreaseButtonPressed(_ sender: Any) {
        if countNumber > 0 {
            countNumber -= 1
            updateCounterView(message: "значение изменено на -1")
        } else {
            updateCounterView(message: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        countNumber = 0
        counterView.text = "\(countNumber)"
        updateCounterView(message: "значение сброшенно")
    }
}

