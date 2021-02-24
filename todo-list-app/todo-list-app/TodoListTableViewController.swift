//
//  TodoListTableViewController.swift
//  todo-list-app
//
//  Created by Ayokunle on 22/02/2021.
//

import UIKit
import CoreData

class TodoListTableViewController: UITableViewController {
   
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var models = [TodoListItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationItem.title = "Todo-List"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemOrange]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemOrange]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .systemOrange
        navigationController?.navigationBar.prefersLargeTitles = true
        
        getAllItems()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    
}
