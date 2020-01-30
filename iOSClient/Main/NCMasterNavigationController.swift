//
//  NCMasterNavigationController.swift
//  Nextcloud
//
//  Created by Marino Faggiana on 30/01/2020.
//  Copyright © 2020 Marino Faggiana. All rights reserved.
//

import Foundation

class NCMasterNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
                
        if self.splitViewController?.isCollapsed == true {
            if (topViewController as? UITabBarController) != nil {
                self.isNavigationBarHidden = true
            } else {
                self.isNavigationBarHidden = false
            }
        } else {
            self.isNavigationBarHidden = true
        }
    }
}
