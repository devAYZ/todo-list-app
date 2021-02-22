//
//  TodoListViewController.swift
//  todo-list-app
//
//  Created by Ayokunle on 22/02/2021.
//

import UIKit

class TodoListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(viewTodoLists)
        view.addSubview(addNewTodoList)
        constraint()

        view.backgroundColor = #colorLiteral(red: 0.3098039216, green: 0.5333333333, blue: 0.568627451, alpha: 1)
        navigationItem.title = "HOME"
    }
    
    let viewTodoLists: UIButton = {
        let viewLists = UIButton(type: .system)
        viewLists.setTitle("View Todo Tasks", for: .normal)
        viewLists.isEnabled = true
        viewLists.translatesAutoresizingMaskIntoConstraints = false
        viewLists.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        viewLists.layer.cornerRadius = 8
        viewLists.clipsToBounds = true
        viewLists.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 25)
        viewLists.addTarget(self, action: #selector(viewList), for: .touchUpInside)
        viewLists.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return viewLists
    }()
    
    let addNewTodoList: UIButton = {
        let addNewList = UIButton(type: .system)
        addNewList.setTitle("Add New Task", for: .normal)
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

    }

    
    @objc func viewList() {
        self.navigationController?.pushViewController(ViewListsViewController(), animated: true)
    }
    
    func constraint () {
        NSLayoutConstraint.activate([
            addNewTodoList.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addNewTodoList.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            addNewTodoList.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            addNewTodoList.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            viewTodoLists.topAnchor.constraint(equalTo: addNewTodoList.bottomAnchor, constant: 20),
            viewTodoLists.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewTodoLists.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            viewTodoLists.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
    }
    

}
