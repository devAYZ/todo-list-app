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
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.orange]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .systemOrange
       
        
        getAllItems()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    
}
