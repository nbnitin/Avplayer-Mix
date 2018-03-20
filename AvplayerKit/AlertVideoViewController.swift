//
//  AlertVideoViewController.swift
//  AvplayerKit
//
//  Created by Nitin Bhatia on 20/03/18.
//  Copyright © 2018 Nitin Bhatia. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class AlertVideoViewController: UIViewController {

    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false
    var playerController : AVPlayerViewController!
    var alert : UIAlertController!

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
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: avPlayer.currentItem)
         alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        alert.view.addSubview(playerController.view)
        let height:NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: self.view.frame.height/2)
        let width:NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: self.view.frame.height/2)
        alert.view.addConstraint(height)
        alert.view.addConstraint(width)
        playerController.view.frame = CGRect(x: 0, y: 0, width: alert.view.frame.width, height: alert.view.frame.height)
        self.present(alert, animated: true, completion: nil)
    
        avPlayer.play()
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        avPlayer.pause()
        playerController.view.isHidden = true
        playerController.removeFromParentViewController()
        alert.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    

    
  

}
