//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate{
    
    var AudioPlayer :AVAudioPlayer!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    
    
    
    @IBAction func notePressed(_ sender: UIButton) {
    
     playSound(buttonSender: sender.tag)
    
    

    }
    
    
    
    
   
    func playSound(buttonSender:Int)
    {
        for i in 1...7
        {
            
            let keyword = "note"
            if buttonSender == i
            {
                
                let soundUrl = Bundle.main.url(forResource: "\(keyword)\(i)", withExtension: "wav")
                
                do
                {
                    AudioPlayer = try AVAudioPlayer(contentsOf: soundUrl!)
                    
                }
                catch
                {
                    print(error)
                }
                AudioPlayer.play()
                break
            }
        }
        
    }
    
    
    
  

}

