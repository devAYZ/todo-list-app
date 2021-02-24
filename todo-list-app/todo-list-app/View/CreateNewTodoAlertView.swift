
import UIKit
 
var todoAlert = UIAlertController()

func addTaskButton() {
    
    todoAlert = UIAlertController(title: "New Task", message: "Creaate new task", preferredStyle: .alert)
    
    todoAlert.addTextField(configurationHandler: nil)
    
    let alertAction = UIAlertAction(title: "Save task", style: .cancel, handler: { _ in
        
        guard let textfield = todoAlert.textFields?.first, let todoText = textfield.text, !todoText.isEmpty else { return }
        
    })
    
    todoAlert.addAction(alertAction)
    
}
