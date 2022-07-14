//
//  SocialCell.swift
//  Hack
//
//  Created by Nikita Nagornov on 14.07.2022.
//

import Foundation
import UIKit

class SocialCell: UICollectionViewCell {
    static let identifier = "SocialCell"

    @IBOutlet var image: UIImageView!
    @IBOutlet var text: UILabel!
    @IBOutlet var subTitle: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var commentCount: UILabel!
    @IBOutlet var likeCount: UILabel!
    @IBOutlet var imageBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ cell: SocialCellObject) {
        
        image.image = cell.icon
        text.text = cell.text
        subTitle.text = cell.subTitle
        title.text = cell.title
        text.text = cell.text
        commentCount.text = String(cell.commentCount)
        likeCount.text = String(cell.likeCount)
        imageBackground.backgroundColor = cell.iconBackgroundColor
        imageBackground.clipsToBounds = true
        imageBackground.layer.cornerRadius = 8
        
        clipsToBounds = true
        layer.cornerRadius = 12
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

struct SocialCellObject {
    var icon: UIImage
    var iconBackgroundColor: UIColor
    var title: String
    var subTitle: String
    var text: String
    var likeCount: Int
    var commentCount: Int
}

