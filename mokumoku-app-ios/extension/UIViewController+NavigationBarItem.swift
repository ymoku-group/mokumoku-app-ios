//
//  UIViewController+NavigationBarItem.swift
//  mokumoku-app-ios
//
//  Created by aseo on 2019/02/27.
//  Copyright © 2019年 YMoku. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setNavigationBarItem() {
        self.addLeftBarButtonWithImage(UIImage(named: "ic_menu_black_24dp")!)
        self.slideMenuController()?.removeLeftGestures()
    }
    
    func removeNavigationBarItem() {
        self.navigationItem.leftBarButtonItem = nil
        self.slideMenuController()?.removeLeftGestures()
    }
}
