//
//  TodoListTableViewController.swift
//  todo-list-app
//
//  Created by Ayokunle on 22/02/2021.
//

import UIKit
import CoreData

class TodoListTableViewController: UITableViewController {
    public static let copyTodoListTableViewController = TodoListTableViewController()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var models = [TodoListItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationItem.title = "Todo-List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        
        getAllItems()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    
}
