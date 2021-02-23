//
//  TodoListItem+CoreDataProperties.swift
//  todo-list-app
//
//  Created by Ayokunle on 23/02/2021.
//
//

import Foundation
import CoreData


extension TodoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoListItem> {
        return NSFetchRequest<TodoListItem>(entityName: "TodoListItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var createdAt: Date?

}

extension TodoListItem : Identifiable {

}
