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
    
    // TODO:: 1 构建自定义cell ToDoItemCell
    func setupTableView() {
        
        let cellNib = UINib(nibName: "TodoItemCell", bundle: nil)
        
        tableView.register(cellNib, forCellReuseIdentifier: cellIdentifier)
        
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.estimatedRowHeight = 100
        
        
    }
    
    // TODO:: 2 构建 Navigation Controller， Title ：ToDoey

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return todoItems.count
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:cellIdentifier, for: indexPath) as! TodoItemCell
        
        cell.textLabel?.text = todoItems[indexPath.row]
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 1
    }
    
}
