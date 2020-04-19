//
//  LoginViewController.swift
//  CDLiveStreaming
//
//  Created by chengdong on 2020/4/16.
//  Copyright © 2020 chengdong. All rights reserved.
//

import UIKit
import IJKMediaFramework
import SnapKit

class LoginViewController: UIViewController {
    
    private lazy var player : IJKFFMoviePlayerController = {
         //视频源地址
//        let url = URL.init(string: "http://ivi.bupt.edu.cn/hls/cctv1hd.m3u8")
//        let path = "http://ivi.bupt.edu.cn/hls/cctv1hd.m3u8"
        let resource = arc4random() % 2 == 0 ? "login_video" : "loginmovie";
        let path = Bundle.main.path(forResource: resource, ofType: "mp4")
        //初始化播放器，播放在线视频或直播（RTMP）
        let player = IJKFFMoviePlayerController.init(contentURLString: path, with: IJKFFOptions.byDefault())
        player!.scalingMode = .aspectFill
        player!.shouldAutoplay = true
        return player!
    }()
    
    private lazy var loginView : ThirdLoginView = {
        let view = ThirdLoginView.loadFromNib()
        view.loginClosure = { [weak self] type in
            print(type)
            if let delegate = UIApplication.shared.delegate,let window = delegate.window {
                window?.rootViewController = ViewController()
            }
        }
        return view
    }()
    
    private lazy var coverView : UIImageView = {
        let imgV = UIImageView(image: UIImage(named: "LaunchImage"))
        return imgV
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(player.view)
        player.view.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        view.addSubview(loginView)
        loginView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.height.equalTo(60)
            make.bottom.equalTo(view).offset(-60)
        }
        
        view.addSubview(coverView)
        coverView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addMovieNotificationObservers()
        player.prepareToPlay()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        player.shutdown()
        removeMovieNotificationObservers()
    }
    
    private func addMovieNotificationObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(loadStateDidChange), name: NSNotification.Name.IJKMPMoviePlayerLoadStateDidChange, object:player)
        NotificationCenter.default.addObserver(self, selector: #selector(moviePlayBackDidFinish(notification:)), name: NSNotification.Name.IJKMPMoviePlayerPlaybackDidFinish, object:player)
        
//        NotificationCenter.default.addObserver(self, selector: Selector(("mediaIsPreparedToPlayDidChange")), name: NSNotification.Name.IJKMPMediaPlaybackIsPreparedToPlayDidChange, object:player)
//        NotificationCenter.default.addObserver(self, selector: Selector(("moviePlayBackStateDidChange")), name: NSNotification.Name.IJKMPMoviePlayerPlaybackStateDidChange, object:player)
    }
    
    private func removeMovieNotificationObservers(){
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func loadStateDidChange(){
        let loadState = player.loadState
        if (loadState.rawValue & IJKMPMovieLoadState.playthroughOK.rawValue) != 0 {
            if player.isPlaying() {
                coverView.isHidden = true
            }
        } else if (loadState.rawValue & IJKMPMovieLoadState.stalled.rawValue) != 0 {
            
        } else {
            
        }
    }
        
    @objc private func moviePlayBackDidFinish(notification : NSNotification){
        let reason = IJKMPMovieFinishReason.init(rawValue: notification.userInfo?[IJKMPMoviePlayerPlaybackDidFinishReasonUserInfoKey] as! Int)
        switch reason {
        case .playbackEnded:
            player.play()
//        case .userExited:
//
//        case .playbackError:
//
        default:
            print("lallalal")
        }
    }
}
