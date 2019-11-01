//
//  ViewController.swift
//  AppArchitecture+TestingEO
//
//  Created by mcs on 10/30/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit

/*
 App Architectures
 1. MVC = Model View Controller
 2. MVVM = Model View ViewModel
 3. VIPER = View Interactor Presenter Entity Router
 
 view model is used for mvvm, do not use var episode array and controller
 */

class ViewController: UIViewController {

  @IBOutlet weak var archTableView: UITableView!
  
  let viewModel = EpisodesViewModel()

//  var episodeArray: [Episode] = []
//  let controller = EpisodeController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    archTableView.dataSource = self
    archTableView.delegate = self
//    controller.getEpisodes { [weak self] (episodes) in
//      guard let episodes = episodes else { return }
//      self?.episodeArray = episodes
//      DispatchQueue.main.async {
//        self?.archTableView.reloadData()
//      }
//
//    }
    viewModel.getEpisodes { [weak self] in
      DispatchQueue.main.async {
        self?.archTableView.reloadData()
      }
    }
  }


}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return episodeArray.count
    return viewModel.numberOfEpisodes()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    let episodeViewModel = viewModel.getViewModel(for: indexPath.row)
//    let episode = episodeArray[indexPath.row]
//    cell.textLabel?.text = "Name: \(episode.name)"
//    cell.detailTextLabel?.text = "Season Number \(episode.season)"
    cell.textLabel?.text = "Name: \(episodeViewModel.getEpisodeName())"
    cell.detailTextLabel?.text = "Season Number: \(episodeViewModel.getSeasonNumber())"
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    let episode = episodeArray[indexPath.row]
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let detailViewController = storyboard.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
//    detailViewController.episode = episode
    detailViewController.episodeViewModel = viewModel.getViewModel(for: indexPath.row)
    navigationController?.pushViewController(detailViewController, animated: true)
  }
}
