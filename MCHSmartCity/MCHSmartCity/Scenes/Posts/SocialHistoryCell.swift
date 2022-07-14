//
//  SocialHistoryCell.swift
//  Hack
//
//  Created by Nikita Nagornov on 14.07.2022.
//

import Foundation
import UIKit

class SocialHistoryCell: UICollectionViewCell {
    static let identifier = "SocialHistoryCell"

    @IBOutlet var background: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ cell: SocialHistoryCellObject) {
        background.image = cell.background
        background.clipsToBounds = true
        background.layer.cornerRadius = 12
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

struct SocialHistoryCellObject {
    var background: UIImage
}
