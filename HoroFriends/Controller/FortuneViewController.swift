//
//  ViewController.swift
//  HoroFriends
//
//  Created by usr on 2020/12/29.
//

import UIKit
import SnapKit
import SwiftyGif
import Alamofire

class FortuneViewController: UIViewController {
    
    // MARK: - Properties
    let lauchImageView = LaunchingAnimationView()
    
    private let statusBar: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:   199/255,//R199
                                       green: 237/255,//G237
                                       blue:  255/255,//B255
                                       alpha: 1.0)
        return view
    }()
    
    private let background: UIImageView = {
        UIImageView(image: UIImage(named: "fortune_background"))
    }()
    
    private let leftBackground: UIImageView = {
        UIImageView(image: UIImage(named: "fortune_starbackground_left"))
    }()
    
    private let rightBackground: UIImageView = {
        UIImageView(image: UIImage(named: "fortune_starbackground_right"))
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.text = "今日運勢"
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 35)
        label.textColor = .white
        label.text = Date().toDateString()
        return label
    }()
    
    private lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.text = Date().toWeekDayString()
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        launchAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        lauchImageView.gifImageView.startAnimatingGif()
        HoroService.shared.fetchFortunes() { fortunes in
            fortunes.forEach { f in
                print(f)
            }
        }
        
    }
    
    // MARK: - Helpers    
    func launchAnimation() {
        
        view.addSubview(lauchImageView)
        lauchImageView.frame = UIScreen.main.bounds
        lauchImageView.gifImageView.delegate = self
        
    }
    
    func configureUI() {
        
        let screenWidth = UIScreen.main.bounds.width
        
        view.addSubview(background)
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(statusBar)
        statusBar.snp.makeConstraints { make in
            make.top.left.right.equalTo(self.view)
            make.height.equalTo(45)
        }
        
        view.addSubview(leftBackground)
        leftBackground.snp.makeConstraints { make in
            make.top.equalTo(statusBar.snp.bottom)
            make.left.equalToSuperview().offset(14);
            make.width.equalTo(screenWidth * (33.9 / 375));
            make.height.equalTo(122)
        }
        
        view.addSubview(rightBackground)
        rightBackground.snp.makeConstraints { make in
            make.top.equalTo(statusBar.snp.bottom)
            make.right.equalToSuperview().offset(-14)
            make.width.equalTo(screenWidth * (33.9 / 375));
            make.height.equalTo(122)
        }
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(statusBar.snp.bottom).offset(21)
        }
        
        view.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        
        view.addSubview(dayLabel)
        dayLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dateLabel.snp.bottom).offset(5)
        }
        
    }
}

// MARK: - SwiftyGifDelegate
extension FortuneViewController: SwiftyGifDelegate {
    func gifDidStop(sender: UIImageView) {
        lauchImageView.isHidden = true
        //view.backgroundColor = UIColor(named: "launch color")
        configureUI()
    }
}

