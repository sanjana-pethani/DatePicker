//
//  ViewController.swift
//  DatePicker
//
//  Created by Sanjana pethani on 14/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePiker: UIDatePicker!
    @IBOutlet weak var bookingDateTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureDatePicker()
    }
    
    private func setup() {
        bookingDateTextField.delegate = self
    }
    
    func configureDatePicker() {
        datePiker.preferredDatePickerStyle = .wheels
        datePiker.datePickerMode = .date
        datePiker.maximumDate = Calendar.current.date(bySetting: .day, value: 2, of: Date())
        datePiker.minimumDate = Date()
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        print(sender.date)
        bookingDateTextField.text = sender.date.convertToString(format: "dd MMM yyyy")
        Calendar.current.date(byAdding: .day, value: 2, to: Date())
    }
}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.tag == 0{
            datePiker.isHidden = false
            return false
        }
        return true
    }
}

extension String {
    func convertToDate(format: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self) ?? Date()
    }
}

extension Date {
    func convertToString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
