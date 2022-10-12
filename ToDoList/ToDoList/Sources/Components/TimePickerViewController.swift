//
//  TimePickerViewController.swift
//  ToDoList
//
//  Created by Anderson Sales on 09/10/22.
//

import UIKit

protocol TimePickerProtocol {
    func sendTime(time: String)
}

class TimePickerViewController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //MARK: Var/Lets
    public var delegate: TimePickerProtocol?
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: IBAction
    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender == self.okButton {
            self.dismiss(animated: true) {
                guard let delegate = self.delegate else{return}
                let datePickerSelect: Date = self.datePicker.date
                let dateString = Date().convertDateToString(date: datePickerSelect, dateFormatter: "HH:mm")
                delegate.sendTime(time: dateString)
            }
        } else if sender == self.cancelButton {
            self.dismiss(animated: true)
        }
    }
}
