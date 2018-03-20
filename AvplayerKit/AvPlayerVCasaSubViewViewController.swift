//
//  AvPlayerVCasaSubViewViewController.swift
//  AvplayerKit
//
//  Created by Nitin Bhatia on 20/03/18.
//  Copyright © 2018 Nitin Bhatia. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class AvPlayerVCasaSubViewViewController: UIViewController {
    
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false
    var playerController : AVPlayerViewController!
    
    @IBOutlet weak var videoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnPlay(_ sender: Any) {
        let theURL = Bundle.main.url(forResource:"splash", withExtension: "mp4")
        avPlayer = AVPlayer(url: theURL!)
        playerController = AVPlayerViewController()
        playerController.player = avPlayer
       // self.addChildViewController(playerController)
        self.videoView.addSubview(playerController.view)
        playerController.view.frame = CGRect(x: 0, y: 0, width:self.videoView.frame.width  , height: self.videoView.frame.height)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: avPlayer.currentItem)
        
       
        avPlayer.play()
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        avPlayer.pause()
        playerController.view.isHidden = true
        playerController.removeFromParentViewController()
    }




  

}
