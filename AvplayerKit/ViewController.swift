//
//  ViewController.swift
//  AvplayerKit
//
//  Created by Nitin Bhatia on 20/03/18.
//  Copyright © 2018 Nitin Bhatia. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var subView: UIView!
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let theURL = Bundle.main.url(forResource:"splash", withExtension: "mp4")
        
        avPlayer = AVPlayer(url: theURL!)
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        avPlayer.volume = 0
        avPlayer.actionAtItemEnd = .none
        
        
        avPlayerLayer.frame = subView.layer.bounds
        subView.backgroundColor = .clear
        subView.layer.insertSublayer(avPlayerLayer, at: 0)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: avPlayer.currentItem)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc
    func playerItemDidReachEnd(notification: Notification) {
        
        //do your code....
        
//        let sb = UIStoryboard(name: "Home", bundle: nil)
//        let vc = sb.instantiateInitialViewController()
//        let window = UIWindow()
//        window.rootViewController = vc
//        window.makeKeyAndVisible()
//        self.present(vc!, animated: true, completion: nil)
        
        print("video finished")
        
        //below code helps to restart video
        //        let p: AVPlayerItem = notification.object as! AVPlayerItem
        //        p.seek(to: kCMTimeZero, completionHandler: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        avPlayer.play()
        paused = false
    }
    
   
}

