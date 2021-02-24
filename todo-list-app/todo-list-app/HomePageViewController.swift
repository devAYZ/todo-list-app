//
//  TodoListViewController.swift
//  todo-list-app
//
//  Created by Ayokunle on 22/02/2021.

import UIKit

class HomePageViewController: UIViewController {
    
    let test = UILabel()
    let viewListsButton = UIButton(type: .system)
    let addNewListButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = .white
        view.addSubview(viewListsButton)
        view.addSubview(addNewListButton)
        
        setupViewListButton()
        setupAddNewListButton()
        setupHomeButtonConstraint()
    }
    
}
