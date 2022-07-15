//
//  CreateDreamViewController.swift
//  MCHSmartCity
//
//  Created by Nikita Nagornov on 15.07.2022.
//

import Foundation
import UIKit

class CreateDreamViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var data = [TasksDetailCellObject]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TasksDetailCell.identifier, for: indexPath) as! TasksDetailCell
        cell.configureCell(data[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    
    @IBOutlet var tableHeight: NSLayoutConstraint?
    @IBOutlet var textField: UITextField?
    @IBOutlet var ready: UIButton?
    @IBOutlet var add: UIButton?
    @IBOutlet var table: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        table
        
        table?.dataSource = self
        table?.delegate = self
//        table.dragDelegate = self
//        table.dragInteractionEnabled = true
        
        
        table?.backgroundColor = .clear
        table?.showsVerticalScrollIndicator = false
        table?.register(TasksDetailCell.nib(), forCellReuseIdentifier: TasksDetailCell.identifier)
        
        data.append(TasksDetailCellObject(title: "Интерфейс программы", isEditing: true))
        data.append(TasksDetailCellObject(title: "Настройки Blender", isEditing: true))
        data.append(TasksDetailCellObject(title: "Базовый мэш", isEditing: true))
        data.append(TasksDetailCellObject(title: "Интерфейс программы 2", isEditing: true))
        data.append(TasksDetailCellObject(title: "Настройки Blender 2", isEditing: true))
        data.append(TasksDetailCellObject(title: "Базовый мэш 2", isEditing: true))
        
        
        tableHeight?.constant = CGFloat(data.count * 60)
        view.layoutIfNeeded()
        
        UITextField.appearance().tintColor = .white
        
        let placeholderText = NSAttributedString(string: "Я хочу...",
                                                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        textField?.attributedPlaceholder = placeholderText
        
        navigationController?.isNavigationBarHidden = true
    }
}
