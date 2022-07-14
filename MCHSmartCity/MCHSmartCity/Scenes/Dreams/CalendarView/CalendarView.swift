//
//  CalendarView.swift
//
//
//  Created by Nikita Nagornov on 15.07.2022.
//

import UIKit

var selectedDate = Date()

protocol CalendarTappedDelegate: AnyObject {
    func selectDate(selectDate: Date)
}

@IBDesignable
class CalendarView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var containerView: UIView!
    
    var totalSquares = [Date]()
//    weak var delegate: CalendarTappedDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCalendarView()
        setCellsView()
        setWeekView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        selectedDate = Date()
//        delegate.selectDate(selectDate: selectedDate)
        setWeekView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
        
    private func configureCalendarView() {
        let bundle = Bundle(for: CalendarView.self)
        bundle.loadNibNamed("CalendarView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func setBackgroundColor(color: UIColor) {
        contentView.backgroundColor = color
    }
}

extension CalendarView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 40.0, height: 56.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let totalCellWidth = 40 * collectionView.numberOfItems(inSection: 0)
        let totalSpacingWidth = 20 * (collectionView.numberOfItems(inSection: 0) - 1)

        var inset = (collectionView.layer.frame.size.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        
        if inset < 0 {
            inset = 0
        }
        
        return UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
    
    func setCellsView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CalendarViewCell.nib(), forCellWithReuseIdentifier: CalendarViewCell.identifire)
    }
    
    func setWeekView() {
        totalSquares.removeAll()
        
        let previousYear = Calendar.current.date(
            byAdding: .year,
            value: -1,
            to: Date())!
        
        var current = CalendarHelper().sundayForDate(date: previousYear)
        let nextYear = CalendarHelper().addDays(date: previousYear, days: 365*2)
        
        while current < nextYear {
            totalSquares.append(current)
            current = CalendarHelper().addDays(date: current, days: 1)
        }
        collectionView.reloadData()
        collectionView.scrollToItem(at: IndexPath(row: 365 + 9, section: 0),
                                    at: .centeredHorizontally, animated: false)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalSquares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarViewCell.identifire, for: indexPath) as! CalendarViewCell
        let date = totalSquares[indexPath.item]
        cell.numberDayLabel.text = String(CalendarHelper().dayOfMonth(date: date))
        cell.weekDayNameLabel.text = date.getNameWeekDay()
        if date.get(.day) == selectedDate.get(.day) && date.get(.month) == selectedDate.get(.month) {
            cell.containerView.backgroundColor = .hexToUIColor("F6D3A0")
            cell.numberDayLabel.textColor = .hexToUIColor("1E1E1F")
            cell.weekDayNameLabel.textColor = .hexToUIColor("4F4F52")
        } else {
//            if Calendar.current.isDate(date, equalTo: Date(), toGranularity: .day) {
//                cell.containerView.backgroundColor = contentView.backgroundColor
//                cell.numberDayLabel.textColor = .green
//                cell.weekDayNameLabel.textColor = .green
//                cell.containerView.layer.borderColor = UIColor.brown.cgColor
//                cell.containerView.layer.borderWidth = 1.5
//            } else {
            cell.containerView.backgroundColor = contentView.backgroundColor
            cell.numberDayLabel.textColor = UIColor.white
            cell.weekDayNameLabel.textColor = .hexToUIColor("8D8E8F")
            cell.containerView.layer.borderWidth = 0
//            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedDate = totalSquares[indexPath.item]
        print("Tap to index \(totalSquares[indexPath.item])")
//        delegate.selectDate(selectDate: selectedDate)
        collectionView.reloadData()
    }
}
