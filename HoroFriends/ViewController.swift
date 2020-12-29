//
//  ViewController.swift
//  HoroFriends
//
//  Created by usr on 2020/12/29.
//

import UIKit
import SwiftyGif

class ViewController: UIViewController {
    
    let lauchImageView = LaunchingAnimationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        lauchImageView.gifImageView.startAnimatingGif()
    }
    
    // MARK: - Helpers
    func configureUI() {
        view.addSubview(lauchImageView)
        lauchImageView.frame = UIScreen.main.bounds
        lauchImageView.gifImageView.delegate = self
    }
}

extension ViewController: SwiftyGifDelegate {
    func gifDidStop(sender: UIImageView) {
        lauchImageView.isHidden = true
        view.backgroundColor = UIColor(named: "launch color")
    }
}
