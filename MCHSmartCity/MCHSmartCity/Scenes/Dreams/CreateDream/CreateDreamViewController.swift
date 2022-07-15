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
        table?.dataSource = self
        table?.delegate = self
        
        
        table?.backgroundColor = .clear
        table?.showsVerticalScrollIndicator = false
        table?.register(TasksDetailCell.nib(), forCellReuseIdentifier: TasksDetailCell.identifier)
        
        UITextField.appearance().tintColor = .white
        
        let placeholderText = NSAttributedString(string: "Я хочу...",
                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        textField?.attributedPlaceholder = placeholderText
        
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func readyTap(_ sender: Any) {
        let targetVC = navigationController?.viewControllers.filter {$0 is DreamsExtendedViewController}
        let dreamsVC = targetVC![0] as! DreamsExtendedViewController
        dreamsVC.addData(text: newTaskTitle, count: data.count)
        
        navigationController?.popToViewController(dreamsVC, animated: true)
    }
    
    @IBAction func addTap(_ sender: Any) {
        data.append(TasksDetailCellObject(title: "", isEditing: true))
        table?.reloadData()
        tableHeight?.constant = CGFloat(data.count * 45)
        view.updateConstraints()
        view.layoutSubviews()
    }
    
    @IBAction func saveTitle(_ sender: Any) {
        newTaskTitle = textField?.text ?? ""
    }
}
