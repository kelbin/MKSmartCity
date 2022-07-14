//
//  TasksCell.swift
//
//
//  Created by Nikita Nagornov on 14.07.2022.
//

import Foundation
import UIKit

class TasksCell: UICollectionViewCell {
    static let identifier = "TasksCell"

    @IBOutlet var date: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var subTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ cell: TasksCellObject) {
        backgroundColor = .clear
        layer.backgroundColor = UIColor.clear.cgColor
        layer.cornerRadius = 12
        clipsToBounds = true
        
        title.text = cell.title
        subTitle.text = cell.subtitle
        date.text = cell.date
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

struct TasksCellObject {
    var isChecked: Bool
    
    var date: String
    
    var title: String
    
    var subtitle: String
}
