//
//  ListTaskViewController.swift
//  ToDoList
//
//  Created by Anderson Sales on 09/10/22.
//

import UIKit

class ListTaskViewController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var addTaskButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Var/Lets
    private var list: [MyTask] = []
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.registerNib()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.loadListItens()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? TaskManagerTableViewController {
            guard let task = sender as? MyTask? else {return}
            controller.task = task
        }
    }
    
    //MARK: Private/Public Func
    private func registerNib(){
        self.tableView.register(UINib(nibName: "EmptyTableViewCell", bundle: nil), forCellReuseIdentifier: "emptyTableCell")
    }
    
    private func loadListItens(){
        self.list = DefaultTaskHelper().getTaskList()
        self.tableView.reloadData()
    }
    
    private func callCreateTask(task: MyTask?){
        self.performSegue(withIdentifier: "createNewTask", sender: nil)
    }
    
    //MARK: Action
    @IBAction func addTaskButtonTapped(_ sender: UIButton) {
        self.callCreateTask(task: nil)
    }
}

//MARK: UITableViewDelegate, UITableViewDataSource
extension ListTaskViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count > 0 ? self.list.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.list.count > 0 {
            let cell: TaskTableViewCell = tableView.dequeueReusableCell(withIdentifier: "callCellTasklist", for: indexPath) as! TaskTableViewCell
            let task: MyTask = self.list[indexPath.row]
            cell.setTime(time: task.time)
            cell.setDate(date: task.date)
            cell.setDescription(description: task.description)
            return cell
        } else {
            let cell: EmptyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "emptyTableCell", for: indexPath) as! EmptyTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.list.count > 0 ? 120 : 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.list.count > 0 {
            self.callCreateTask(task: self.list[indexPath.row])
        } else {
            self.callCreateTask(task: nil)
        }
    }
    
}
