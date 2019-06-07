//
//  NewViewController.swift
//  segues
//
//  Created by Ebuka Egbunam on 6/2/19.
//  Copyright © 2019 Ebuka Egbunam. All rights reserved.
//

import UIKit

protocol CanReceive {
    func dataRecieved(data:String)
}


class NewViewController: UIViewController {
    var delegate : CanReceive?
    var data = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        label2.text = data

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var textout2: UITextField!
    
    
    @IBOutlet var textoutlet2: UIView!
    
    
    @IBAction func button2(_ sender: Any) {
        label2.backgroundColor = UIColor.blue
        delegate?.dataRecieved(data: String(textout2.text!))
        dismiss(animated: true, completion: nil)
       
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
