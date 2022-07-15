//
//  DreamsViewController.swift
//  Hack
//
//  Created by Nikita Nagornov on 14.07.2022.
//

import Foundation
import UIKit

class DreamsExtendedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    @IBOutlet var plus: UIImageView!
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let currentNewsList = newsList[indexPath.item]
//        let currentCell = DreamsCell()
        
        if collectionView == self.collectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DreamsExtendedCell.identifier, for: indexPath) as? DreamsExtendedCell else { return UICollectionViewCell() }
            
            cell.configureCell(DreamsExtendedCellObject(icon: .init(imageLiteralResourceName: "dreamsCellImage"), name: "Изучить Blender", percent: 30, dreamsCount: 15))
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TasksCell.identifier, for: indexPath) as? TasksCell else { return UICollectionViewCell() }
            
            cell.configureCell(TasksCellObject(isChecked: true, date: "15:00", title: "Интерфейс программы", subtitle: "Изучить Blender (4/15)"))
            
            return cell
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presentModal()
    }
    
    private func presentModal() {
        let storyboard = UIStoryboard(name: "TaskDetail", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TaskDetailSID")
        let nav = UINavigationController(rootViewController: vc)

        nav.modalPresentationStyle = .pageSheet

        if let sheet = nav.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
        }
        present(nav, animated: true, completion: nil)
    }
    
    private func presentModal2() {
        let storyboard = UIStoryboard(name: "Social", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SocialSID")
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true, completion: nil)
    }
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var taskCollectionView: UICollectionView!
    
    @objc func tappedMe()
    {
        let storyboard = UIStoryboard(name: "CreateDream", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CreateDreamSID")
        navigationController?.pushViewController(vc, animated: true)
        navigationController?.isNavigationBarHidden = true
//        let nav = UINavigationController(rootViewController: vc)
//        present(nav, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = ""
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedMe))
        plus.addGestureRecognizer(tap)
        plus.isUserInteractionEnabled = true

        
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 240, height: 180)
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(DreamsExtendedCell.nib(), forCellWithReuseIdentifier: DreamsExtendedCell.identifier)
        
        
        taskCollectionView.delegate = self
        taskCollectionView.dataSource = self
        let taskCollectionViewLayout = UICollectionViewFlowLayout()
        taskCollectionViewLayout.scrollDirection = .vertical
        taskCollectionViewLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 74)
        taskCollectionView.collectionViewLayout = taskCollectionViewLayout
        taskCollectionView.backgroundColor = .clear
        taskCollectionView.showsVerticalScrollIndicator = false
        taskCollectionView.register(TasksCell.nib(), forCellWithReuseIdentifier: TasksCell.identifier)
        
        
        
        print("LLLL")
    }
}
