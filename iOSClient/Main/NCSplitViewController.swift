//
//  NCSplitViewController.swift
//  Nextcloud
//
//  Created by Marino Faggiana on 30/01/2020.
//  Copyright © 2020 Marino Faggiana. All rights reserved.
//

import UIKit

class NCSplitViewController: UISplitViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.preferredDisplayMode = .allVisible
        
        let navigationController = viewControllers.first as? UINavigationController
        if let tabBarController = navigationController?.topViewController as? UITabBarController {
            appDelegate.createTabBarController(tabBarController)
        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if #available(iOS 13.0, *) {
            if CCUtility.getDarkModeDetect() {
                if traitCollection.userInterfaceStyle == .dark {
                    CCUtility.setDarkMode(true)
                } else {
                    CCUtility.setDarkMode(false)
                }
                NotificationCenter.default.post(name: Notification.Name.init(rawValue: "changeTheming"), object: nil)
            }
        }
    }
}

extension NCSplitViewController: UISplitViewControllerDelegate {
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
