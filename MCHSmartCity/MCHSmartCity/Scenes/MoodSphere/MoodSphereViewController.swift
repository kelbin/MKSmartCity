//
//  MoodSphereViewController.swift
//  MCHSmartCity
//
//  Created by Kelbinary on 14.07.2022.
//

import UIKit
import FancyGradient

final class MoodSphereViewController: UIViewController, FancyGradientViewDelegate {
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var stateArray: [String] = ["Радостная булочка", "Довольная жабка", "Интересующийся картофель"]
    
    var fancyView: FancyGradientView!
    var isStarted: Bool = true
    var myCustomAnimation: CustomAnimation = CustomAnimation(animID: "myAnimationID")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fancyView = FancyGradientView(colors: [.white],
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
        
        
        statusLabel.text = ""
        
        switch GlobalData.sharedInstance.model.title {
        case "Радость":
            stateLabel.text = stateArray[0]
            statusLabel.text = "Накопленный стресс: -\(Int.random(in: 0..<20))%"
        case "Благодарность":
            stateLabel.text = stateArray[1]
            statusLabel.text = "Накопленный стресс: +\(Int.random(in: 0..<20))%"
        case "Интерес":
            stateLabel.text = stateArray[2]
            statusLabel.text = "Накопленный стресс: -\(Int.random(in: 0..<20))%"
        default:
            break
        }
        
        GlobalData.sharedInstance.model.colors.forEach { color in
            fancyView.colors.insert(color, at: 1)
        }
        
        
    }
    
    private func addNewColorMood(_ colors: UIColor) {
        
        fancyView.colors.insert(colors, at: 1)
        
        let myCustomAnimation = CustomAnimation(animID: "newID")
            .then(ColorAnimation(newColors: [colors], duration: 5))
            .then(DirectionAnimation(newDirection: .down, duration: 5))
            
        
        fancyView.animate(animation: myCustomAnimation)
    }
    
    func startAnimation() {
        
        myCustomAnimation = CustomAnimation(animID: "myAnimationID")
            .then(DirectionAnimation(newDirection: .right, duration: 5))
            .then(ColorAnimation(newColors: [.yellow], duration: 5))
            .then(DirectionAnimation(newDirection: .down, duration: 5))
            
        
        fancyView.animate(animation: myCustomAnimation)
    }
    
    func reverseAnimation() {
        myCustomAnimation = CustomAnimation(animID: "myAnimationID")
            .then(DirectionAnimation(newDirection: .diagonalBottomRightTopLeft, duration: 5))
            .then(ColorAnimation(newColors: [.purple], duration: 5))
            .then(DirectionAnimation(newDirection: .up, duration: 5))
            
        
        fancyView.animate(animation: myCustomAnimation)
    }
    
    @IBAction func tapToAddColor(_ sender: Any) {
        addNewColorMood(.random())
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

}

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
