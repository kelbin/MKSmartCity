//
//  TaskDetailCell.swift
//  
//
//  Created by Nikita Nagornov on 14.07.2022.
//

import Foundation
import UIKit

class TasksDetailCell: UITableViewCell {
    static let identifier = "TasksDetailCell"
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        
        
        // Initialization code
    }
    
    func configureCell(_ cell: TasksDetailCellObject) {
        title.text = cell.title
        
        if cell.isEditing {
            textField.isHidden = false
            title.isHidden = true
        } else {
            title.isHidden = false
            textField.isHidden = true
        }
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

struct TasksDetailCellObject {
    var title: String
    
    var isEditing: Bool
}
