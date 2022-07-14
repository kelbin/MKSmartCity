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

    @IBOutlet var background: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ cell: DreamsCellObject) {
        background.image = cell.background
        background.clipsToBounds = true
        background.layer.cornerRadius = 12
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

struct DreamsCellObject {
    var background: UIImage
}
