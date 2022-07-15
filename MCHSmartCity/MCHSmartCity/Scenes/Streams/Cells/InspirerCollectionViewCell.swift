//
//  InspirerCollectionViewCell.swift
//  MCHSmartCity
//
//  Created by Kelbinary on 14.07.2022.
//

import UIKit

final class InspirerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}

extension InspirerCollectionViewCell: Setupable {
    
    func setup(_ model: Any) {
        guard let object = model as? InspirerViewModel else { return }
        
        iconImageView.image = object.image
        nicknameLabel.text = object.name
    }
    
}

struct InspirerViewModel: CommonEntity {
    var cellIdentifier: String {
        return "InspirerCollectionViewCell"
    }
    
    var size: CGSize = CGSize(width: 150, height: 250)
    
    let name: String
    let image: UIImage?
}
