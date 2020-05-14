//
//  ViewController.swift
//  MoviePicker
//
//  Created by Test on 11/05/2020.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var videoPlayer: AVPlayer?
    
    var videoPlayerLayer: AVPlayerLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Set up video in background
        setupVideo()
    }
    
    func setUpElements() {
        
        // Style the elements
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleWhiteButton(loginButton)
        
    }
    
    func setupVideo() {
        
        // Get the path to the resource in the bundle
        let bundlePath = Bundle.main.path(forResource: "video2", ofType: "mp4")
        
        guard bundlePath != nil else { return }
        
        // Create url from it
        let url = URL(fileURLWithPath: bundlePath!)
        
        // Create video player item
        let item = AVPlayerItem(url: url)
        
        // Create player
        videoPlayer = AVPlayer(playerItem: item)
        
        // Create layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        // Adjust size and frame
        videoPlayerLayer?.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width*1, height: self.view.frame.size.height*1)
        
        // Add it to the view and play it
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        videoPlayer?.playImmediately(atRate: 0.6)
    }


}

