//
//  LoginViewController.swift
//  ToDoList
//
//  Created by Anderson Sales on 09/10/22.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func createTasksButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "callInitialTask", sender: nil)
    }
}
