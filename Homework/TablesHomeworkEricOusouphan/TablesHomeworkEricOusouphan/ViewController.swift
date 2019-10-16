//
//  ViewController.swift
//  TablesHomeworkEricOusouphan
//
//  Created by mcs on 10/11/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DetailedViewControllerDelegate, DetailedDelegateTwo {
    @IBOutlet weak var tableOne: UITableView!
    
    var rocketsArray  = ["James Harden", "Russell Westbrook", "Clint Capela", "PJ Tucker", "Eric Gordon"]
    
    @IBOutlet weak var tableTwo: UITableView!
    
    var jojoArray = ["Jonathan", "Joseph", "Jotaro", "Josuke", "Giorno"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableOne.dataSource = self //as! UITableViewDataSource
        tableOne.register(UITableViewCell.self, forCellReuseIdentifier: "rocketsCell")
        tableOne.delegate = self as UITableViewDelegate
        
        
        // Do any additional setup after loading the view.
        
        tableTwo.dataSource = self // as! UITableViewDataSource
        tableTwo.register(UITableViewCell.self, forCellReuseIdentifier: "jojoCell")
        tableTwo.delegate = self as UITableViewDelegate
        
        
        
        
    }
    
    func update(with newValue: String?) {
    guard let newValue = newValue,
      let selectedIndexPath = tableOne.indexPathForSelectedRow
        else { return }
        
    rocketsArray[selectedIndexPath.row] = newValue
    tableOne.reloadRows(at: [selectedIndexPath], with: .automatic)
    }
    
    func update2(with newValue: String?) {
        guard let newValue = newValue, let selectedIndexPath = tableTwo.indexPathForSelectedRow
            else { return }
        jojoArray[selectedIndexPath.row] = newValue
        tableTwo.reloadRows(at: [selectedIndexPath], with: .automatic)
    }
    
}


extension ViewController: UITableViewDataSource {

    
func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        
    
        var counter: Int?
        
        if tableView == tableOne {
            counter = rocketsArray.count
        }
        if tableView == tableTwo {
            counter = jojoArray.count
        }
        return counter ?? 7
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tableOne{
            let cellOne = UITableViewCell(style: .default, reuseIdentifier: "rocketsCell")
            cellOne.textLabel?.text = rocketsArray[indexPath.row]
            
            return cellOne
        }
        
        if tableView == tableTwo{
            
            let cellTwo = UITableViewCell(style: .default, reuseIdentifier: "jojoCell")
            cellTwo.textLabel?.text = jojoArray[indexPath.row]
            
            return cellTwo
        }
        
        
        return UITableViewCell()

    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let detailedViewController = storyboard.instantiateViewController(withIdentifier: "DetailedViewStory") as! DetailedViewController
        
        if tableView == tableOne {
            detailedViewController.stringToEdit = rocketsArray[indexPath.row]
        }
        if tableView == tableTwo {
            detailedViewController.stringToEdit = jojoArray[indexPath.row]
        }
        
  
        detailedViewController.delegate = self
        detailedViewController.delegateTwo = self
            navigationController?.pushViewController(detailedViewController, animated: true)
        

    }
    }
    
    
    
    
    
    
    
    
    
    
    
    
//  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //tells delegate that specified row is now selected
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    let detailedViewController = storyboard.instantiateViewController(withIdentifier: "DetailedViewController") as! DetailedViewController
//    detailedViewController.stringToEdit = rocketsArray[indexPath.row]
//    detailedViewController.delegate = (self as! DetailedViewControllerDelegate)
////    present(detailViewController, animated: true, completion: nil)
//    navigationController?.pushViewController(detailedViewController, animated: true)

// }


