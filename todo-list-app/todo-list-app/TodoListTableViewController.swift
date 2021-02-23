//
//  TodoListTableViewController.swift
//  todo-list-app
//
//  Created by Ayokunle on 22/02/2021.
//

import UIKit

class TodoListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        navigationItem.title = "Todo-List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }

    
    @objc func addButtonTapped() {
        addTaskButton()
        self.present(todoAlert, animated: true, completion: nil)
    }
    
    func getAllItems() {
        
    }
    
    func createItem(name: String) {
        
    }
    
    func deleteItem(item: TodoListItem) {
        
    }
    
    func updateItem(item: TodoListItem) {
        
    }
}
