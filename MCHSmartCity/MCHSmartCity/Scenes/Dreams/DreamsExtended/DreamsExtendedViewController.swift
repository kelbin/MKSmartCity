//
//  DreamsViewController.swift
//  Hack
//
//  Created by Nikita Nagornov on 14.07.2022.
//

import Foundation
import UIKit

var newTaskTitle: String = ""

class DreamsExtendedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var data = [DreamsExtendedCellObject]()
    var data2 = [TasksCellObject]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return data.count
        }
        else {
            return data2.count
        }
    }
    
    @IBOutlet var plus: UIImageView!
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let currentNewsList = newsList[indexPath.item]
//        let currentCell = DreamsCell()
        
        if collectionView == self.collectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DreamsExtendedCell.identifier, for: indexPath) as? DreamsExtendedCell else { return UICollectionViewCell() }
            
            cell.configureCell(data[indexPath.row])
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TasksCell.identifier, for: indexPath) as? TasksCell else { return UICollectionViewCell() }
            
            cell.configureCell(data2[indexPath.row])
            
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

        
        
        data.append(DreamsExtendedCellObject(icon: .init(imageLiteralResourceName: "dreamsCellImage"), name: "Изучить Blender", percent: 30, dreamsCount: 15))
        data.append(DreamsExtendedCellObject(icon: .init(imageLiteralResourceName: "dreamsCellImage"), name: "Изучить Дизайн", percent: 30, dreamsCount: 15))
        data.append(DreamsExtendedCellObject(icon: .init(imageLiteralResourceName: "dreamsCellImage"), name: "Научиться водить", percent: 30, dreamsCount: 15))
        data.append(DreamsExtendedCellObject(icon: .init(imageLiteralResourceName: "dreamsCellImage"), name: "Выучить стих", percent: 30, dreamsCount: 15))
        data.append(DreamsExtendedCellObject(icon: .init(imageLiteralResourceName: "dreamsCellImage"), name: "Научиться готовить", percent: 30, dreamsCount: 15))
        
        
        data2.append(TasksCellObject(isChecked: true, date: "15:00", title: "Интерфейс программы", subtitle: "Изучить Blender (1/5)"))
        data2.append(TasksCellObject(isChecked: true, date: "12:00", title: "Создание макета", subtitle: "Изучить Blender (2/5)"))
        data2.append(TasksCellObject(isChecked: true, date: "11:00", title: "Проверка требований", subtitle: "Изучить Blender (3/5)"))
        data2.append(TasksCellObject(isChecked: true, date: "15:00", title: "Доработка решения", subtitle: "Изучить Blender (4/5)"))
        data2.append(TasksCellObject(isChecked: true, date: "19:00", title: "Презентация", subtitle: "Изучить Blender (5/5)"))
        
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
        
    }
    
    func addData(text: String, count: Int) {
        data.insert(DreamsExtendedCellObject(icon: .init(imageLiteralResourceName: "dreamsCellImage"), name: text, percent: 0, dreamsCount: count), at: 0)
        collectionView.reloadData()
    }
}
