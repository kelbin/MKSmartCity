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
            vc.navigationController?.navigationBar.backItem?.title = ""
            vc.navigationItem.title = ""
            vc.navigationItem.backButtonTitle = ""
            vc.navigationItem.backBarButtonItem?.image = .init(imageLiteralResourceName: "back")
            navigationController?.pushViewController(vc, animated: true)
            navigationController?.navigationBar.backItem?.title = ""
            navigationController?.navigationItem.backButtonTitle = ""
//            present(vc, animated: true, completion: nil)
        } else if indexPath.row == 1 {
            
            let vc = MoodSphereViewController(nibName: "MoodSphereViewController", bundle: nil)
            vc.navigationController?.navigationBar.backItem?.title = ""
            vc.navigationItem.title = ""
            vc.navigationItem.backButtonTitle = ""
            vc.navigationItem.backBarButtonItem?.image = .init(imageLiteralResourceName: "back")
            navigationController?.pushViewController(vc, animated: true)
            navigationController?.navigationBar.backItem?.title = ""
            navigationController?.navigationBar.tintColor = .white
            navigationController?.navigationItem.backButtonTitle = ""
            
        }
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        data.append(DreamsCellObject(background: .init(imageLiteralResourceName: "dreams-1"), title: "Мои мечты", subtitle: "9 задач", image: .init(imageLiteralResourceName: "dreams-11")))
        data.append(DreamsCellObject(background: .init(imageLiteralResourceName: "dreams-2"), title: "Дневник эмоций", subtitle: "1 запись", image: .init(imageLiteralResourceName: "dreams-21")))
        data.append(DreamsCellObject(background: .init(imageLiteralResourceName: "dreams-3"), title: "Дневник благодарностей", subtitle: "1 запись", image: .init(imageLiteralResourceName: "dreams-31")))
        data.append(DreamsCellObject(background: .init(imageLiteralResourceName: "dreams-4"), title: "Карта желаний", subtitle: "4 записи", image: .init(imageLiteralResourceName: "dreams-41")))
        
        collectionView.delegate = self
        collectionView.dataSource = self
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: 165, height: 200)
//        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(DreamsCell.nib(), forCellWithReuseIdentifier: DreamsCell.identifier)
        
        presentModal()
    }
    
    private func presentModal() {
        let vc = MoodSphereDetailViewController(nibName: "MoodSphereDetailViewController", bundle: nil)
        let nav = UINavigationController(rootViewController: vc)

        nav.modalPresentationStyle = .pageSheet

        if let sheet = nav.sheetPresentationController {
            sheet.detents = [.large()]
        }
        present(nav, animated: true, completion: nil)
    }
}
