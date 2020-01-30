//
//  NCMasterNavigationController.swift
//  Nextcloud
//
//  Created by Marino Faggiana on 30/01/2020.
//  Copyright © 2020 Marino Faggiana. All rights reserved.
//

import Foundation

class NCMasterNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        // changeTheming
        NotificationCenter.default.addObserver(self, selector: #selector(self.changeTheming), name: NSNotification.Name(rawValue: "changeTheming"), object: nil)
        changeTheming()
    }

    @objc func changeTheming() {
        navigationBar.barTintColor = NCBrandColor.sharedInstance.brand
        navigationBar.tintColor = NCBrandColor.sharedInstance.brandText
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
