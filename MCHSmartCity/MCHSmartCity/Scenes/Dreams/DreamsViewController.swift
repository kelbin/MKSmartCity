//
//  DreamsViewController.swift
//
//
//  Created by Nikita Nagornov on 14.07.2022.
//

import Foundation
import UIKit

class DreamsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var data = [DreamsCellObject]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DreamsCell.identifier, for: indexPath) as? DreamsCell else { return UICollectionViewCell() }
        
        cell.configureCell(data[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let storyboard = UIStoryboard(name: "DreamsExtended", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "DreamsExtendedSID")
            navigationController?.pushViewController(vc, animated: true)
//            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data.append(DreamsCellObject(background: .init(imageLiteralResourceName: "dreams-1")))
        data.append(DreamsCellObject(background: .init(imageLiteralResourceName: "dreams-2")))
        data.append(DreamsCellObject(background: .init(imageLiteralResourceName: "dreams-3")))
        data.append(DreamsCellObject(background: .init(imageLiteralResourceName: "dreams-4")))
        
        collectionView.delegate = self
        collectionView.dataSource = self
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: 165, height: 200)
//        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(DreamsCell.nib(), forCellWithReuseIdentifier: DreamsCell.identifier)
        
        
    }
}
