//
//  StreamsViewController.swift
//  MCHSmartCity
//
//  Created by Kelbinary on 14.07.2022.
//

import UIKit

final class StreamsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var streamsLabel: UILabel!
    @IBOutlet weak var coursesLabel: UILabel!
    @IBOutlet weak var inspirerLabel: UILabel!
    
    @IBOutlet weak var carouselImages: UICollectionView!
    @IBOutlet weak var carouselStreams: UICollectionView!
    @IBOutlet weak var carouselInspirers: UICollectionView!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var carouselCourses: UICollectionView!
    
    let scrollView: UIScrollView = UIScrollView()
    
    var models: [CommonEntity] = []
    
    var carouselStreamsModel: [CommonEntity] = [StreamsViewModel(videoId: "e-rzGkpf3lY", isPlayed: true),
                                                StreamsViewModel(videoId: "HlpArxeuuIQ", isPlayed: false),
                                                StreamsViewModel(videoId: "SddiTg0uvrM", isPlayed: false)]
    
    var carouselInspirerModel: [CommonEntity] = [InspirerViewModel(name: "Антон Гопка", image: UIImage(named: "img1")),
                                                 InspirerViewModel(name: "Денис Ефремов", image: UIImage(named: "img2")),
                                                 InspirerViewModel(name: "Наталья Галкина", image: UIImage(named: "img3"))]
    
    var carouselSIModel: [CommonEntity] = [SIViewModel(name: "test"),
                                           SIViewModel(name: "test"),
                                           SIViewModel(name: "test")]
    
    
    var carouselCoursesModel: [CommonEntity] = [CoursesViewModel(),
                                                CoursesViewModel(),
                                                CoursesViewModel()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        
        let CSNib = UINib(nibName: "StreamsCollectionViewCell", bundle: nil)
        let CINib = UINib(nibName: "InspirerCollectionViewCell", bundle: nil)
        let SINib = UINib(nibName: "SICollectionViewCell", bundle: nil)
        let CONib = UINib(nibName: "CoursesCollectionViewCell", bundle: nil)
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(container)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 340)
        
        carouselStreams.register(CSNib, forCellWithReuseIdentifier: "StreamsCollectionViewCell")
        carouselInspirers.register(CINib, forCellWithReuseIdentifier: "InspirerCollectionViewCell")
        carouselImages.register(SINib, forCellWithReuseIdentifier: "SICollectionViewCell")
        carouselCourses.register(CONib, forCellWithReuseIdentifier: "CoursesCollectionViewCell")
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "2")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(tapToRightButton))
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 13))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        self.navigationItem.titleView = imageView
    }
    
    @objc func tapToRightButton() {
        
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case carouselImages:
            return carouselSIModel.count
        case carouselStreams:
            return carouselStreamsModel.count
        case carouselInspirers:
            return carouselInspirerModel.count
        case carouselCourses:
            return carouselCoursesModel.count
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var model: [CommonEntity] = []
        
        switch collectionView {
        case carouselStreams:
            model = carouselStreamsModel
        case carouselInspirers:
            model = carouselInspirerModel
        case carouselImages:
            model = carouselSIModel
        case carouselCourses:
            model = carouselCoursesModel
        default:
            break
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: model[indexPath.row].cellIdentifier, for: indexPath)
            
        (cell as? Setupable)?.setup(model[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var model: [CommonEntity] = []
        
        switch collectionView {
        case carouselStreams:
            model = carouselStreamsModel
        case carouselInspirers:
            model = carouselInspirerModel
        case carouselImages:
            model = carouselSIModel
        case carouselCourses:
            model = carouselCoursesModel
        default:
            break
        }
        
        return model[indexPath.row].size
    }
}
