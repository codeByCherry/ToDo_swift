//
//  TodoListViewController.swift
//  ToDo
//
//  Created by Tony Zhang on 2018/11/08.
//  Copyright © 2018年 SSM. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    let todoItems = ["go to school", "play ps4" ]
    
    let cellIdentifier = "TodoItemCell"
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        
    }
    
    
    // MARK:- TODOS
    

    func setupTableView() {
        
        let cellNib = UINib(nibName: "TodoItemCell", bundle: nil)
        
        tableView.register(cellNib, forCellReuseIdentifier: cellIdentifier)
        
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.estimatedRowHeight = 100
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return todoItems.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:cellIdentifier, for: indexPath) as! TodoItemCell
        
        cell.textLabel?.text = todoItems[indexPath.row]
        
        if let _ = cell.selectedBackgroundView {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
            view.backgroundColor = UIColor.init(white: 0.9, alpha: 0.9)
            cell.selectedBackgroundView = view
        }
        
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 1
        
    }
    
    
    // MARK:- TableView Delegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
        } else {
            cell?.accessoryType = .checkmark
        }
        
    }
    
}
