//
//  ViewController.swift
//  segues
//
//  Created by Ebuka Egbunam on 6/2/19.
//  Copyright © 2019 Ebuka Egbunam. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CanReceive {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var textoutlet1: UITextField!
    
    @IBAction func button1(_ sender: Any) {
        performSegue(withIdentifier: "send1", sender: self)
    }
    @IBAction func text1(_ sender: Any) {
    }
    @IBOutlet weak var label1: UILabel!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "send1"
        {
            let newVC = segue.destination as! NewViewController
            newVC.data = textoutlet1.text!
            newVC.delegate = self // need this because of delegate
        }
    }
    
    func dataRecieved(data: String) {
        label1.text = data
        
    }
    
}

