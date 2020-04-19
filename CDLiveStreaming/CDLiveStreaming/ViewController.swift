//
//  ViewController.swift
//  CDLiveStreaming
//
//  Created by Tung on 2020/3/20.
//  Copyright © 2020年 chengdong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Getters and Setters
    lazy var session: LFLiveSession = {
        let audioConfiguration = LFLiveAudioConfiguration.default()
        
        let videoConfiguration = LFLiveVideoConfiguration.defaultConfiguration(for: LFLiveVideoQuality.low3)
        let session = LFLiveSession(audioConfiguration: audioConfiguration, videoConfiguration: videoConfiguration)
        session?.delegate = self as! LFLiveSessionDelegate
        session?.preView = self.view
        return session!
    }()
    
    //MARK: - Event
    func startLive() -> Void {
        let stream = LFLiveStreamInfo()
        stream.url = "your server rtmp url";
        session.startLive(stream)
    }
    
    func stopLive() -> Void {
        session.stopLive()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
    }

}

extension ViewController : LFLiveSessionDelegate{
    //MARK: - Callback
    func liveSession(_ session: LFLiveSession?, debugInfo: LFLiveDebug?){
        
    }
    func liveSession(_ session: LFLiveSession?, errorCode: LFLiveSocketErrorCode){
        
    }
    func liveSession(_ session: LFLiveSession?, liveStateDidChange state: LFLiveState){
        
    }
}

