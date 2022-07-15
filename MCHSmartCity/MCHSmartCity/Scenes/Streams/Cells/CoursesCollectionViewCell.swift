//
//  CoursesCollectionViewCell.swift
//  MCHSmartCity
//
//  Created by Kelbinary on 15.07.2022.
//

import UIKit

final class CoursesCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

extension CoursesCollectionViewCell: Setupable {
    
    func setup(_ model: Any) {
//        guard let object = model as? StreamsViewModel else { return }
//        self.isPlayed = object.isPlayed
    }
    
}

struct CoursesViewModel: CommonEntity {
    var cellIdentifier: String {
        return "CoursesCollectionViewCell"
    }
    
    var size: CGSize = CGSize(width: 320, height: 200)
    
}
