//
//  DreamsCell.swift
//  MCHSmartCity
//
//  Created by Nikita Nagornov on 15.07.2022.
//

import Foundation
import UIKit

class DreamsCell: UICollectionViewCell {
    static let identifier = "DreamsCell"

    @IBOutlet var subtitle: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var background: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ cell: DreamsCellObject) {
        background.image = cell.background
        background.clipsToBounds = true
        background.layer.cornerRadius = 12
        
        title.text = cell.title
        subtitle.text = cell.subtitle
        image.image = cell.image
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

struct DreamsCellObject {
    var background: UIImage
    
    var title: String
    
    var subtitle: String
    
    var image: UIImage
}
