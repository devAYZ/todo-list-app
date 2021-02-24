//
//  TodoListViewController.swift
//  todo-list-app
//
//  Created by Ayokunle on 22/02/2021.

import UIKit

class HomePageViewController: UIViewController {
    
    let test = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(viewTodoLists)
        view.addSubview(addNewTodoList)
        constraint()
        

        view.backgroundColor = .white
        navigationItem.title = "HOME PAGE"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    let viewTodoLists: UIButton = {
        let viewLists = UIButton(type: .system)
        viewLists.setTitle("View All Lists", for: .normal)
        viewLists.isEnabled = true
        viewLists.translatesAutoresizingMaskIntoConstraints = false
        viewLists.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        viewLists.layer.cornerRadius = 8
        viewLists.clipsToBounds = true
        viewLists.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 25)
        viewLists.addTarget(self, action: #selector( viewList(_:) ), for: .touchUpInside)
        viewLists.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return viewLists
    }()
    
    let addNewTodoList: UIButton = {
        let addNewList = UIButton(type: .system)
        addNewList.setTitle("Add New List", for: .normal)
        addNewList.isEnabled = true
        addNewList.translatesAutoresizingMaskIntoConstraints = false
        addNewList.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        addNewList.layer.cornerRadius = 8
        addNewList.clipsToBounds = true
        addNewList.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 25)
        addNewList.addTarget(self, action: #selector(addList), for: .touchUpInside)
        addNewList.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return addNewList
    }()
    
    @objc func addList() {
        
        let copyTodoListTableViewController = TodoListTableViewController()
        
        copyTodoListTableViewController.addButtonTapped()
        
//        self.present(todoAlert, animated: true, completion: nil)

    }

    @objc func viewList(_ sender: Any) {
        
        let viewList = UINavigationController(rootViewController: TodoListTableViewController() )
        present(viewList, animated: true, completion: nil)
        
    }
    
    func constraint () {
        NSLayoutConstraint.activate([
            addNewTodoList.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addNewTodoList.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            addNewTodoList.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065),
            addNewTodoList.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            
            viewTodoLists.topAnchor.constraint(equalTo: addNewTodoList.bottomAnchor, constant: 40),
            viewTodoLists.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewTodoLists.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065),
            viewTodoLists.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
        ])
    }
}
