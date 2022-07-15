//
//  AppDelegate.swift
//  MCHSmartCity
//
//  Created by Kelbinary on 12.07.2022.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000, vertical: 0), for:UIBarMetrics.default)
        
        let first = StreamsViewController(nibName: "StreamsViewController", bundle: nil)
        first.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "folders"), selectedImage: nil)
        first.tabBarItem.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        let nav1 = UINavigationController()
        nav1.viewControllers = [first]
        nav1.title = "first"
        nav1.navigationBar.barTintColor = .black
        
        let storyboard1 = UIStoryboard(name: "Dreams", bundle: nil)
        let second = storyboard1.instantiateViewController(withIdentifier: "DreamsViewControllerSID")
        second.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Tab"), selectedImage: nil)
        second.tabBarItem.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        let nav2 = UINavigationController()
        nav2.viewControllers = [second]
        nav2.setNavigationBarHidden(false, animated: true)
        nav2.title = "second"
        
        let storyboard = UIStoryboard(name: "Social", bundle: nil)
        let third = storyboard.instantiateViewController(withIdentifier: "SocialSID")
        third.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "tab-Comment"), selectedImage: nil)
        third.tabBarItem.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        let nav3 = UINavigationController()
        nav3.viewControllers = [third]
        nav3.setNavigationBarHidden(false, animated: true)
        nav3.title = "third"
        
        let fourth = MoodSphereViewController(nibName: "MoodSphereViewController", bundle: nil)
        fourth.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Tab"), selectedImage: nil)
        fourth.tabBarItem.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        let nav4 = UINavigationController()
        nav4.viewControllers = [fourth]
        nav4.setNavigationBarHidden(false, animated: true)
        nav4.title = "fourh"
        
        let tabbar = AnimatedTabbarController()
        tabbar.setViewControllers([nav1, nav2, nav3, nav4], animated: true)
        tabbar.selectedIndex = 0
        
        tabbar.tabBar.barTintColor = .black
        tabbar.tabBar.tintColor = .white
        
        window?.rootViewController = tabbar
        
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

