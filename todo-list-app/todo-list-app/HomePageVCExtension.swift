//
//  HomePageVCExtension.swift
//  todo-list-app
//
//  Created by Ayokunle on 24/02/2021.
//

import Foundation
import UIKit

extension HomePageViewController {
        
    func setupViewListButton(){
        viewListsButton.setTitle("View All Lists", for: .normal)
        viewListsButton.isEnabled = true
        viewListsButton.translatesAutoresizingMaskIntoConstraints = false
        viewListsButton.setTitleColor(.white, for: .normal)
        viewListsButton.layer.cornerRadius = 8
        viewListsButton.clipsToBounds = true
        viewListsButton.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 25)
        viewListsButton.addTarget(self, action: #selector( viewList(_:) ), for: .touchUpInside)
        viewListsButton.backgroundColor = .systemOrange
        
    }
    
    func setupAddNewListButton() {
        
        addNewListButton.setTitle("Add New List", for: .normal)
        addNewListButton.isEnabled = true
        addNewListButton.translatesAutoresizingMaskIntoConstraints = false
        addNewListButton.setTitleColor(.white, for: .normal)
        addNewListButton.layer.cornerRadius = 8
        addNewListButton.clipsToBounds = true
        addNewListButton.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 25)
        addNewListButton.addTarget(self, action: #selector(addList), for: .touchUpInside)
        addNewListButton.backgroundColor = .systemOrange
    
    }
    
    @objc func addList() {
        
        let copyTodoListTableViewController = TodoListTableViewController()
        
        
        let todoAlert = UIAlertController(title: "CREATE ITEM", message: "Type Your New Todo Item", preferredStyle: .alert)
        
        todoAlert.addTextField(configurationHandler: nil)
        
        let alertAction = UIAlertAction(title: "Save Item", style: .cancel, handler: { _ in
            
            guard let textfield = todoAlert.textFields?.first, let todoText = textfield.text, !todoText.isEmpty else { return }
            copyTodoListTableViewController.createItem(name: todoText)
            
        })
        todoAlert.addAction(alertAction)
        
        present(todoAlert, animated: true, completion: nil)
        
    }
    
    @objc func viewList(_ sender: Any) {
        
        let viewList = UINavigationController(rootViewController: TodoListTableViewController() )
        present(viewList, animated: true, completion: nil)
        
    }
    
    func setupHomeButtonConstraint () {
        NSLayoutConstraint.activate([
            addNewListButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addNewListButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            addNewListButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065),
            addNewListButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            
            viewListsButton.topAnchor.constraint(equalTo: addNewListButton.bottomAnchor, constant: 40),
            viewListsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewListsButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065),
            viewListsButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
        ])
    }
}
