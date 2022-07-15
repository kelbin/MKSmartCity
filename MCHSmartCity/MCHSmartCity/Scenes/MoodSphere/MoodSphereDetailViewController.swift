//
//  MoodSphereDetailViewController.swift
//  MCHSmartCity
//
//  Created by Kelbinary on 15.07.2022.
//

import UIKit
import FancyGradient

struct ButtonModel {
    let title: String
    let selected: Bool
    let colors: [UIColor]
}

final class GlobalData: NSObject {
   static let sharedInstance = GlobalData()

   private override init() { }

    var model: ButtonModel = ButtonModel(title: "", selected: false, colors: [])
}

final class MoodSphereDetailViewController: UIViewController, FancyGradientViewDelegate {
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    var fancyView: FancyGradientView!
    var myCustomAnimation: CustomAnimation = CustomAnimation(animID: "myAnimationID")
    
    var isStarted: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fancyView = FancyGradientView(colors: [],
                                      direction: .diagonalTopLeftBottomRight,
                                      type: .axial)
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.layer.masksToBounds = true
        blurEffectView.layer.cornerRadius = 240 / 2
        
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        fancyView.translatesAutoresizingMaskIntoConstraints = false
        fancyView.delegate = self
        fancyView.layer.cornerRadius = 240 / 2
        
        self.view.addSubview(fancyView)
        fancyView.addSubview(blurEffectView)
        
        fancyView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -40).isActive = true
        fancyView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        fancyView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        fancyView.widthAnchor.constraint(equalToConstant: 240).isActive = true
        
        startAnimation()
        
        self.view.bringSubviewToFront(blurEffectView)
        
        blurEffectView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -40).isActive = true
        blurEffectView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        blurEffectView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        blurEffectView.widthAnchor.constraint(equalToConstant: 240).isActive = true
    }
    
    func startAnimation() {
        myCustomAnimation = CustomAnimation(animID: "myAnimationID")
            .then(DirectionAnimation(newDirection: .right, duration: 3))
            .then(ColorAnimation(newColors: [.yellow], duration: 3))
            .then(DirectionAnimation(newDirection: .down, duration: 3))
            
        
        fancyView.animate(animation: myCustomAnimation)
    }
    
    func reverseAnimation() {
        myCustomAnimation = CustomAnimation(animID: "myAnimationID")
            .then(DirectionAnimation(newDirection: .diagonalTopRightBottomLeft, duration: 3))
            .then(ColorAnimation(newColors: [.purple], duration: 3))
            .then(DirectionAnimation(newDirection: .up, duration: 3))
            
        
        fancyView.animate(animation: myCustomAnimation)
    }

    private func addNewColorMood(_ colors: [UIColor]) {
        fancyView.colors = colors
        
        let myCustomAnimation = CustomAnimation(animID: "newID")
            .then(ColorAnimation(newColors: colors, duration: 5))
            .then(DirectionAnimation(newDirection: .down, duration: 5))
            
        
        fancyView.animate(animation: myCustomAnimation)
    }
    
    func animationDidFinished(animId: String) {
        if isStarted {
            isStarted = false
            reverseAnimation()
        } else {
            isStarted = true
            startAnimation()
        }
    }
    
    @IBAction func tapToHappyButton(_ sender: Any) {
        
        let happyColors = [UIColor(red: 0.984, green: 0.322, blue: 0.322, alpha: 1),
                           UIColor(red: 0.976, green: 0.839, blue: 0.282, alpha: 1)]
        
        let model = ButtonModel(title: "Радость", selected: true, colors: happyColors)
        
        thirdButton.add(border: .bottom, color: .white, width: 2)
        firstButton.remove(border: .bottom)
        secondButton.remove(border: .bottom)
        addNewColorMood(happyColors)
        GlobalData.sharedInstance.model = model
    }
    
    @IBAction func tapToThanksButton(_ sender: Any) {
        
        let thanksColors = [UIColor(red: 0.931, green: 0.322, blue: 0.984, alpha: 1),
                             UIColor(red: 0.26, green: 0.07, blue: 0.8, alpha: 1)]
        
        let model = ButtonModel(title: "Благодарность", selected: true, colors: thanksColors)
        thirdButton.remove(border: .bottom)
        firstButton.remove(border: .bottom)
        secondButton.add(border: .bottom, color: .white, width: 2)
        addNewColorMood(thanksColors)
        GlobalData.sharedInstance.model = model
    }
    
    @IBAction func tapToInterestButton(_ sender: Any) {
        
        let interestColors = [UIColor(red: 0.322, green: 0.507, blue: 0.984, alpha: 1),
                              UIColor(red: 0.282, green: 0.976, blue: 0.56, alpha: 1)]
        
        let model = ButtonModel(title: "Интерес", selected: true, colors: interestColors)
        thirdButton.remove(border: .bottom)
        firstButton.add(border: .bottom, color: .white, width: 2)
        addNewColorMood(interestColors)
        secondButton.remove(border: .bottom)
        GlobalData.sharedInstance.model = model
        
    }
    
    @IBAction func tapToSadButton(_ sender: Any) {
        
    }
    
    @IBAction func tapToContinueButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

enum ViewBorder: String {
    case left, right, top, bottom
}

extension UIView {

    func add(border: ViewBorder, color: UIColor, width: CGFloat) {
        let borderLayer = CALayer()
        borderLayer.backgroundColor = color.cgColor
        borderLayer.name = border.rawValue
        switch border {
        case .left:
            borderLayer.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        case .right:
            borderLayer.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        case .top:
            borderLayer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        case .bottom:
            borderLayer.frame = CGRect(x: 0, y: self.frame.size.height - width + 5, width: self.frame.size.width, height: width)
        }
        self.layer.addSublayer(borderLayer)
    }

    func remove(border: ViewBorder) {
        guard let sublayers = self.layer.sublayers else { return }
        var layerForRemove: CALayer?
        for layer in sublayers {
            if layer.name == border.rawValue {
                layerForRemove = layer
            }
        }
        if let layer = layerForRemove {
            layer.removeFromSuperlayer()
        }
    }

}
