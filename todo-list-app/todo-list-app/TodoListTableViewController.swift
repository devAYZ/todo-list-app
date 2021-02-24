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
    
    private var models = [TodoListItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationItem.title = "Todo-List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        
        getAllItems()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        /*
        if let name = model.name, let date = model.createdAt  {
            cell.textLabel?.text = "\(name)   @-\(date)"
        }
        */
        cell.textLabel?.text = model.name
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    @objc public func addButtonTapped() {
    
        let todoAlert = UIAlertController(title: "CREATE ITEM", message: "Type Your New Todo Item", preferredStyle: .alert)
        
        todoAlert.addTextField(configurationHandler: nil)
        
        let alertAction = UIAlertAction(title: "Save Item", style: .cancel, handler: { [weak self] _ in
            
            guard let textfield = todoAlert.textFields?.first, let todoText = textfield.text, !todoText.isEmpty else { return }
            
            self?.createItem(name: todoText)
        })
        
        todoAlert.addAction(alertAction)
        
        present(todoAlert, animated: true, completion: nil)
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
            getAllItems()
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
