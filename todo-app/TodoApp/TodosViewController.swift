//
//  CrossroadsViewController.swift
//  todo-app
//
//  Created by kacalek on 07/09/2018.
//  Copyright © 2018 kacalek. All rights reserved.
//

import UIKit

class TodosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var todos: [Todo] = []
    
    @IBAction func unwindToHome(sender: UIStoryboardSegue) {
        if let senderVC = sender.source as? TodoNewViewController {
            if let newTodoText = senderVC.newToDoText {
                todos.append(Todo(text: newTodoText))
                tableView.reloadData()
                saveData()
            }
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recycledCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        recycledCell.textLabel?.text = todos[indexPath.row].todoText
        if todos[indexPath.row].isCompleted {
            recycledCell.accessoryType = .checkmark
        }else{
            recycledCell.accessoryType = .none
        }
        return recycledCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todos[indexPath.row].isCompleted = !todos[indexPath.row].isCompleted
        tableView.reloadRows(at: [indexPath], with: .automatic)
        saveData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
//        ["Buy coffee", "Take out the trash", "Netflix and chill"]
//        for index in 1...20 {
//            todos.append(Todo(text: "Todo number: \(index)"))
//        }
        loadData()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let encoder = PropertyListEncoder()
    let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Todos.plist")
    
    func saveData() {
        do {
            let data = try encoder.encode(self.todos)
            try data.write(to: filePath!)
        }
        catch {
            print("Error while trying to save data: \(error)")
        }
    }
    
    func loadData() {
        let decoder = PropertyListDecoder()
        
        if let data = try? Data(contentsOf: filePath!) {
            do {
                let loadedTodos = try decoder.decode([Todo].self, from: data)
                todos.append(contentsOf: loadedTodos)
                tableView.reloadData()
            } catch {
                print("Error while trying to load data: \(error)")
            }
        }
    }
}
