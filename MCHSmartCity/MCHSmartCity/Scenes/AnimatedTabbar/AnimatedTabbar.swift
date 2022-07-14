//
//  AnimatedTabbar.swift
//  MCHSmartCity
//
//  Created by Kelbinary on 14.07.2022.
//
import UIKit

class AnimatedTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    override func viewDidAppear(_ animated: Bool) {
        animationWithIndex(0)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        for (k,v) in (tabBar.items?.enumerated())! {
            if v == item {
                animationWithIndex(k)
            }
        }
    }
    
    func animationWithIndex(_ index:Int){
        
        var tabbarbuttonArray: [Any] = [Any]()
        
        for tabBarBtn in self.tabBar.subviews {
            if tabBarBtn.isKind(of: NSClassFromString("UITabBarButton")!) {
                tabbarbuttonArray.append(tabBarBtn)
            }
        }
        
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        pulse.duration = 0.20
        pulse.repeatCount = 1
        pulse.autoreverses = false
        pulse.fillMode = CAMediaTimingFillMode.forwards
        pulse.isRemovedOnCompletion = false
        pulse.fromValue = 0.7
        pulse.toValue = 1.1

        let tabBarLayer = (tabbarbuttonArray[index] as AnyObject).layer
        tabBarLayer?.add(pulse, forKey: "transform.scale")
        
        for i in 0...3{
            if i != index{
                let otherTabBarLayer = (tabbarbuttonArray[i] as AnyObject).layer
                otherTabBarLayer?.removeAllAnimations()
            }
        }
    }
}
