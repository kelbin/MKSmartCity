//
//  SocialViewController.swift
//  Hack
//
//  Created by Nikita Nagornov on 14.07.2022.
//

import Foundation
import UIKit

class SocialViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var data = [SocialCellObject]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return 8
        }
        
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SocialHistoryCell.identifier, for: indexPath) as? SocialHistoryCell else { return UICollectionViewCell() }
            
            cell.configureCell(SocialHistoryCellObject(background: .init(imageLiteralResourceName: "history")))
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SocialCell.identifier, for: indexPath) as? SocialCell else { return UICollectionViewCell() }
            
            cell.configureCell(data[indexPath.row])
            
            return cell
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var socialCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80, height: 80)
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(SocialHistoryCell.nib(), forCellWithReuseIdentifier: SocialHistoryCell.identifier)
        
        
        data.append(SocialCellObject(icon: .init(imageLiteralResourceName: "socialTabIcon"), iconBackgroundColor: .hexToUIColor("EECCD2"), title: "PinkUnicorn", subTitle: "24 минуты назад", text: """
Сегодня впервые вышел на пробежку!

Удивился новым ощущениям: повысился пульс и ритм дыхания, выросло давление и скорость кровообращения, пару раз, кольнуло с непривычки.

Понимаю, что организм пытается подстроиться под новый режим работы, но на это нужно время, поэтому собираю волю в кулак.
""",
                                                likeCount: 59, commentCount: 20))
        
        data.append(SocialCellObject(icon: .init(imageLiteralResourceName: "socialTabIcon-1"), iconBackgroundColor: .hexToUIColor("BFE0FF"), title: "Foxxy", subTitle: "2 часа назад", text: """
Был очень солнечный день!

Мы с друзьями с удовольствием вышли на пробежку и пробежали вокруг всего нашего красивого города.

Было очень интересно и полезно, мы не переставали удивляться, насколько много есть неизведанных мест вокруг нас. Мы увидели много красивых здания и сооружений.
""",
                                                likeCount: 24, commentCount: 14))
        
        data.append(SocialCellObject(icon: .init(imageLiteralResourceName: "socialTabIcon"), iconBackgroundColor: .hexToUIColor("EECCD2"), title: "Vanya", subTitle: "1 день назад", text: """
Сегодня впервые вышел на пробежку!

Удивился новым ощущениям: повысился пульс и ритм дыхания, выросло давление и скорость кровообращения, пару раз, кольнуло с непривычки.

Понимаю, что организм пытается подстроиться под новый режим работы, но на это нужно время, поэтому собираю волю в кулак.
""",
                                                likeCount: 10, commentCount: 23))
        
        
        socialCollectionView.delegate = self
        socialCollectionView.dataSource = self
        let taskCollectionViewLayout = UICollectionViewFlowLayout()
        taskCollectionViewLayout.scrollDirection = .vertical
        taskCollectionViewLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 375)
        socialCollectionView.collectionViewLayout = taskCollectionViewLayout
        socialCollectionView.backgroundColor = .clear
        socialCollectionView.showsVerticalScrollIndicator = false
        socialCollectionView.register(SocialCell.nib(), forCellWithReuseIdentifier: SocialCell.identifier)
    }
}
