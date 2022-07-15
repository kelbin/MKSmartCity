//
//  TaskDetail.swift
//  
//
//  Created by Nikita Nagornov on 14.07.2022.
//

import Foundation
import UIKit

class TaskDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITableViewDragDelegate {
    
    var data = [TasksDetailCellObject]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
        dragItem.localObject = data[indexPath.row]
        return [ dragItem ]
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let mover = data.remove(at: sourceIndexPath.row)
        data.insert(mover, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, dragPreviewParametersForRowAt indexPath: IndexPath) -> UIDragPreviewParameters? {
        let param = UIDragPreviewParameters()
        param.backgroundColor = .clear
        return param
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TasksDetailCell.identifier, for: indexPath) as! TasksDetailCell
        cell.configureCell(data[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    

    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data.append(TasksDetailCellObject(title: "Интерфейс программы", isEditing: false))
        data.append(TasksDetailCellObject(title: "Настройки Blender", isEditing: false))
        data.append(TasksDetailCellObject(title: "Базовый мэш", isEditing: false))
        data.append(TasksDetailCellObject(title: "Интерфейс программы 2", isEditing: false))
        data.append(TasksDetailCellObject(title: "Настройки Blender 2", isEditing: false))
        data.append(TasksDetailCellObject(title: "Базовый мэш 2", isEditing: false))
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.dragDelegate = self
        tableView.dragInteractionEnabled = true
        
        
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.register(TasksDetailCell.nib(), forCellReuseIdentifier: TasksDetailCell.identifier)
        
        statusLabel.layer.masksToBounds = true
        statusLabel.layer.cornerRadius = 12
    }
    
}
