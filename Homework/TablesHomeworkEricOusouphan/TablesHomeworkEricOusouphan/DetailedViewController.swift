//
//  DetailedViewController.swift
//  TablesHomeworkEricOusouphan
//
//  Created by mcs on 10/12/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit

protocol DetailedViewControllerDelegate {
    func update(with newValue: String?)
}

protocol DetailedDelegateTwo {
    func update2(with newValue: String?)
}


class DetailedViewController: UIViewController {
    
   
    
    @IBOutlet weak var textField: UITextField!
  //  var detailScreen: String?
    var stringToEdit: String?
    var delegate: DetailedViewControllerDelegate?
    var delegateTwo: DetailedDelegateTwo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = stringToEdit
        
        
        
    }
    
    
    @IBAction func submitButton(_ sender: Any) {
        
        delegate?.update(with: textField.text)
        delegateTwo?.update2(with: textField.text)
        navigationController?.popViewController(animated: true)
        
    }
    

}
