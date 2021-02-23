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
    
    private var models = [TodoListItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        

        navigationItem.title = "Todo-List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Table view data source
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.name
        return cell
    }
    
    
    @objc func addButtonTapped() {
        addTaskButton()
        self.present(todoAlert, animated: true, completion: nil)
    }
    
    
    // MARK: - Core Data
    
    func getAllItems() {
        do {
            models = try context.fetch(TodoListItem.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        catch {
            //
        }
    }
    
    func createItem(name: String) {
        
        let newItem = TodoListItem(context: context)
        newItem.name = name
        newItem.createdAt = Date()
        
        do {
            try context.save()
        }
        catch {
            //
        }
        
    }
    
    func deleteItem(item: TodoListItem) {
        
        context.delete(item)
        do {
            try context.save()
        }
        catch {
            //
        }
        
    }
    
    func updateItem(item: TodoListItem, newName: String) {
        
        item.name = newName
        do {
            try context.save()
        }
        catch {
            //
        }
        
    }
}
