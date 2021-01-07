//
//  ViewControllerHelper.swift
//  HoroFriends
//
//  Created by usr on 2021/1/7.
//

import UIKit

extension UIViewController {
    func configureNavigationBar(withTitle title: String) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        //                      OpaqueBackground()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = UIColor(named: "launch color")
        /* ⚠️ 將 NavigationBarAppearance 套用在 NavigationBar 上 */
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        // NavigationBar 標題文字樣式
        navigationItem.title = title
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = true
    }
}
