//
//  TaskManagerTableViewController.swift
//  ToDoList
//
//  Created by Anderson Sales on 09/10/22.
//

import UIKit
import FSCalendar

class TaskManagerTableViewController: UITableViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var timeButton: UIButton!
    
    //MARK: Var/Let
    var time: String = ""
    var date: String = ""
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calendar.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? TimePickerViewController {
            controller.delegate = self
        }
    }
    
    //MARK: IBOActions
    @IBAction func timeButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "callTimePicker", sender: nil)
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        self.createTask()
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    //MARK: Func
    private func createTask(){
        var list: [MyTask] = DefaultTaskHelper().getTaskList()
        let task: MyTask = MyTask(id: list.count+1, description: self.taskDescriptionTextField.text ?? "No Description", time: self.time, date: self.date)
        list.append(task)
        DefaultTaskHelper().saveTaskList(list: list)
        self.dismiss(animated: true)
    }
}

//MARK: Extensions
extension TaskManagerTableViewController: TimePickerProtocol {
    func sendTime(time: String) {
        self.timeButton.setTitle(time, for: .normal)
        self.time = time
    }
}

extension TaskManagerTableViewController {
    //MARK: Table View Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}

extension TaskManagerTableViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.date = Date().convertDateToString(date: date, dateFormatter: "dd/MM/yyyy")
    }
}
