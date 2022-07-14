//
//  CalendarViewCell.swift
//
//
//  Created by Nikita Nagornov on 14.07.2022.
//

import UIKit

class CalendarViewCell: UICollectionViewCell {
    static let identifire = "CalendarViewCell"

    @IBOutlet var weekDayNameLabel: UILabel!
    @IBOutlet var numberDayLabel: UILabel!
    
    @IBOutlet var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
    }
    static func nib() -> UINib {
        return UINib(nibName: "CalendarViewCell", bundle: nil)
    }
    
    private func setupUI() {
        containerView.layer.cornerRadius = 10
    }
    
    func sonfigureCell(numberDayText: String) {
        numberDayLabel.text = numberDayText
    }
}
