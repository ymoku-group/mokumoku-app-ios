//
//  YMokuNavigationController.swift
//  mokumoku-app-ios
//
//  Created by aseo on 2019/02/28.
//  Copyright © 2019年 YMoku. All rights reserved.
//

import UIKit

class YMokuNavigationController: UINavigationController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = ymokuColor
        self.navigationController?.navigationBar.titleTextAttributes = ymokuNavigationBarTitleTextAttribute
        self.navigationBar.tintColor = UIColor.white
    }
}
