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
    private var list: [Task] = []
    
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
    
    //MARK: Private/Public Func
    private func registerNib(){
        self.tableView.register(UINib(nibName: "EmptyTableViewCell", bundle: nil), forCellReuseIdentifier: "emptyTableCell")
    }
    
    private func loadListItens(){
        self.list = DefaultTaskHelper().getTaskList()
        self.tableView.reloadData()
    }
    
    //MARK: Action
    @IBAction func addTaskButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "createNewTask", sender: nil)
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
            
        } else {
            self.performSegue(withIdentifier: "createNewTask", sender: nil)
        }
    }
    
}
