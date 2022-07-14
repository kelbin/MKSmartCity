//
//  SICollectionViewCell.swift
//  MCHSmartCity
//
//  Created by Kelbinary on 14.07.2022.
//

import UIKit

final class SICollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var topInnerLabel: UILabel!
    @IBOutlet weak var topLabel: UIView!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}

extension SICollectionViewCell: Setupable {
    
    func setup(_ model: Any) {
//        guard let object = model as? StreamsViewModel else { return }
//        self.isPlayed = object.isPlayed
    }
}

struct SIViewModel: CommonEntity {
    var cellIdentifier: String {
        return "SICollectionViewCell"
    }
    
    var size: CGSize = CGSize(width: 250, height: 250)
    
    let name: String
}
