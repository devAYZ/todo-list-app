//
//  AlertTextField.swift
//  todo-list-app
//
//  Created by King Bileygr on 2/23/21.
//

import UIKit
var todoAlert = UIAlertController()
func addTaskButton() {
    todoAlert = UIAlertController(title: "CREATE", message: "Type Your New Todo Item", preferredStyle: .alert)
    todoAlert.addTextField(configurationHandler: nil)
    let alertAction = UIAlertAction(title: "Save Todo Item", style: .cancel, handler: { [] _ in
        guard let textfield = todoAlert.textFields?.first, let todoText = textfield.text, !todoText.isEmpty else { return }
    })
    todoAlert.addAction(alertAction)
}

