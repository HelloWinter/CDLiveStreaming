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
        let audioConfiguration = LFLiveAudioConfiguration.defaultConfiguration()
        let videoConfiguration = LFLiveVideoConfiguration.defaultConfigurationForQuality(LFLiveVideoQuality.Low3, landscape: false)
        let session = LFLiveSession(audioConfiguration: audioConfiguration, videoConfiguration: videoConfiguration)
        
        session?.delegate = self
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
    
    //MARK: - Callback
    func liveSession(session: LFLiveSession?, debugInfo: LFLiveDebug?){
        
    }
    func liveSession(session: LFLiveSession?, errorCode: LFLiveSocketErrorCode){
        
    }
    func liveSession(session: LFLiveSession?, liveStateDidChange state: LFLiveState){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

