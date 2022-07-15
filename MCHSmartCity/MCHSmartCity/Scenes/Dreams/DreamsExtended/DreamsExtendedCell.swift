//
//  DreamsCell.swift
//  Hack
//
//  Created by Nikita Nagornov on 14.07.2022.
//

import Foundation
import UIKit

class DreamsExtendedCell: UICollectionViewCell {
    static let identifier = "DreamsExtendedCell"

    @IBOutlet var title: UILabel!
    @IBOutlet var count: UILabel!
    @IBOutlet var percent: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var background: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ cell: DreamsExtendedCellObject) {
        background.layer.cornerRadius = 16
        background.clipsToBounds = true
//        layer.cornerRadius = 16
        backgroundColor = .clear
        layer.backgroundColor = UIColor.clear.cgColor
        
        title.text = cell.name
        
        var text = " ЗАДАЧ"
        switch cell.dreamsCount % 10 {
        case 1:
            text += "А"
        case 2, 3, 4:
            text += "И"
        default:
            break
        }
        count.text = String(cell.dreamsCount) + text
        percent.text = String(cell.percent) + "%"
        progressView.progress = Float(cell.percent) / 100
//        titleNewsLabel.text = currentNews.title
//        newsImageView.loadImage(fromURL: currentNews.imageId)
//        newsImageView.layer.cornerRadius = 16
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

struct DreamsExtendedCellObject {
    var icon: UIImage
    
    var name: String
    
    var percent: Int
    
    var dreamsCount: Int
}
