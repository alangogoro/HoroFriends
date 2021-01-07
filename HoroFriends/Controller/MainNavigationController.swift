//
//  MainNavigationController.swift
//  HoroFriends
//
//  Created by usr on 2021/1/7.
//

import Foundation
import UIKit

class MainNavigationController: UINavigationController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        configureNavigationBar()
    }
    
    // MARK: - Helpers
    func configureNavigationBar() {
        isNavigationBarHidden = true
    }
}
