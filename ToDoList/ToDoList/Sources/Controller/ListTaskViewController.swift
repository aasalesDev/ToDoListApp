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
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.registerNib()
    }
    
    //MARK: Private/Public Func
    private func registerNib(){
        self.tableView.register(UINib(nibName: "EmptyTableViewCell", bundle: nil), forCellReuseIdentifier: "emptyTableCell")
    }
    
    //MARK: Action
    @IBAction func addTaskButtonTapped(_ sender: UIButton) {
        //performSegue(withIdentifier: "createNewTask", sender: nil)
    }
}

//MARK: UITableViewDelegate, UITableViewDataSource
extension ListTaskViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EmptyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "emptyTableCell", for: indexPath) as! EmptyTableViewCell
        //let cell: TaskTableViewCell = tableView.dequeueReusableCell(withIdentifier: "initialTasks", for: indexPath) as! TaskTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Index Path Row: \(indexPath.row)")
    }
    
}
