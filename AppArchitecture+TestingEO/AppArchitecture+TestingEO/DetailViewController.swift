//
//  DetailViewController.swift
//  AppArchitecture+TestingEO
//
//  Created by mcs on 10/30/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit
final class DetailViewController: UIViewController {
  
  @IBOutlet weak var episodeInformationLabel: UILabel!
  var episodeViewModel: EpisodeViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    episodeInformationLabel.text = "Episode Name: \(episodeViewModel.getEpisodeName())\n\nEpisode Season Number: \(episodeViewModel.getSeasonNumber())"
  }
}
