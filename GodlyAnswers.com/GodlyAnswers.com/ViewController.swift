//
//  ViewController.swift
//  GodlyAnswers.com
//
//  Created by Ebuka Egbunam on 5/28/19.
//  Copyright © 2019 Ebuka Egbunam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var arrayOfAns : Array = ["ball1" , "ball2" , "ball3" , "ball4" , "ball5"]
    var index1 = 0
    
    
    
    @IBOutlet weak var asnwerOutlet: UIImageView!
    
    
    
    @IBAction func AnswerGenerato(_ sender: UIButton) {
        updateUI()
    }
    
    
    
    func updateUI()
    {
        index1 = Int(arc4random_uniform(5))
        asnwerOutlet.image = UIImage(named: arrayOfAns[index1])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateUI()
    }
}

