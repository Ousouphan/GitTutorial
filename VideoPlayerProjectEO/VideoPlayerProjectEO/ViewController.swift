//
//  ViewController.swift
//  VideoPlayerProjectEO
//
//  Created by mcs on 11/4/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
  
  var hasShowVideo = false

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("view did appear")
    guard !hasShowVideo else {
      print("already shown the video!")
      return
    }
    defer { hasShowVideo = true }
    guard let sharkURL = Bundle.main.url(forResource: "shark", withExtension: "mp4") else {
      print("Things did not work as planned")
      return
    }
    let player = AVPlayer(url: sharkURL)
//    let playerLayer = AVPlayerLayer(player: player)
//    playerLayer.frame = view.frame
//    view.layer.addSublayer(playerLayer)
//    player.play()
   
    let playerViewController = AVPlayerViewController()
    playerViewController.player = player
    present(playerViewController, animated: true, completion: nil)
    print("video is being played")
  }


}

