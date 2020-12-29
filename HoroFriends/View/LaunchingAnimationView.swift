//
//  LaunchingAnimationView.swift
//  HoroFriends
//
//  Created by usr on 2020/12/29.
//

import UIKit
import SwiftyGif

class LaunchingAnimationView: UIView {
    
    // MARK: - Properties
    let gifImageView: UIImageView = {
        var iv = UIImageView()
        do {
            let gif = try UIImage(gifName: "launching")
            iv = UIImageView(gifImage: gif, loopCount: 3)
        } catch {
            iv = UIImageView(image: UIImage(systemName: "xmark.circle.fill"))
        }
        return iv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    // MARK: - Helpers
    private func configure() {
        // launching gifImageView layout
        addSubview(gifImageView)
        gifImageView.translatesAutoresizingMaskIntoConstraints = false
        gifImageView.centerXAnchor
            .constraint(equalTo: centerXAnchor).isActive = true
        gifImageView.centerYAnchor
            .constraint(equalTo: centerYAnchor).isActive = true
        gifImageView.widthAnchor
            .constraint(equalToConstant: 375).isActive = true
        gifImageView.heightAnchor
            .constraint(equalToConstant: 812).isActive = true
    }
}
