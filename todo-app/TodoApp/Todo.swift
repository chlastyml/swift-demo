//
//  Todo.swift
//  todo-app
//
//  Created by kacalek on 07/09/2018.
//  Copyright © 2018 kacalek. All rights reserved.
//

import UIKit

class Todo: Codable {
    var isCompleted: Bool = false
    var todoText: String!

    init(text: String) {
        todoText = text
    }
}
