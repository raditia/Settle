//
//  TodoListViewController.swift
//  Settle
//
//  Created by Raditia Madya on 16/06/19.
//  Copyright © 2019 Raditia Madya. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
	
	var itemArray = ["To do 1", "To Do 2", "Todo 3"]

	override func viewDidLoad() {
		super.viewDidLoad()
		
		
	}
	
	//MARK - TableView DataSOurce Methods
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "todoItemCell", for: indexPath)
		
		cell.textLabel?.text = itemArray[indexPath.row]
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return itemArray.count
	}
	
	//MARK - TableView Delegate Methods
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
//		tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
		
		if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
			tableView.cellForRow(at: indexPath)?.accessoryType = .none
		}
		else {
			tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
		}
		
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	//MARK - Add New Items
	
	
	@IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
		var newItemTextField = UITextField()
		let alert = UIAlertController(title: "Add new Todo Item", message: "", preferredStyle: .alert)
		let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
			
			// what will happen once the user clicks the add item
			self.itemArray.append(newItemTextField.text!)
			self.tableView.reloadData()
		}
		
		alert.addTextField { (alertTextField) in
			alertTextField.placeholder = "Create new item"
			newItemTextField = alertTextField
			
		}
		alert.addAction(action)
		
		present(alert, animated: true, completion: nil)
	}
	

}

