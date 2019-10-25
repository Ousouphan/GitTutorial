//
//  ViewController.swift
//  EricOusouphanWeek3Test
//
//  Created by mcs on 10/25/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var jeopordyArray: [Jeopordy] = []
  
  
  @IBOutlet weak var jeopordyTable: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    jeopordyTable.dataSource = self
    inProjectJSONParsing()
    }
  
  func inProjectJSONParsing() {
    guard let jeopordyUrl = Bundle.main.url(forResource: "jeopordy", withExtension: "json"), let jsonData = try? Data(contentsOf: jeopordyUrl) else { return }
    guard let jeopordy = try? JSONDecoder().decode([Jeopordy].self, from: jsonData) else {return}
    jeopordyArray = jeopordy
    print(jeopordyArray)
    
  }
  
  }
  
  struct Jeopordy: Codable {
    let answer: String
    let question: String
    let airdate: String
    let createdAt: String
    let categories: CategoriesInfo
    
    enum CodingKeys: String, CodingKey {
      case answer
      case question
      case airdate
      case createdAt = "created_at"
      case categories = "category"
    }
  }
  
  struct CategoriesInfo: Codable {
    let id: Int
    let title: String
    let createdAt: String
    let updatedAt: String
    let cluesCount: Int
    
    enum CodingKeys: String, CodingKey {
      case id
      case title
      case createdAt = "created_at"
      case updatedAt = "updated_at"
      case cluesCount = "clues_count"
    }
  }

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return jeopordyArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    cell.textLabel?.numberOfLines = 6
    cell.textLabel?.text = "Question: " + "\(jeopordyArray[indexPath.row].question)" + "\nAnswer: " + "\(jeopordyArray[indexPath.row].answer)" + "\nClueCount: " + "\(jeopordyArray[indexPath.row].categories.cluesCount)"
    return cell
  }
 
}

extension ViewController: UITableViewDelegate {
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
  let storyboard = UIStoryboard(name: "Main", bundle: .main)
  let DetailviewController = storyboard.instantiateViewController(identifier: "DetailView") as! DetailTableViewCell

}
}
