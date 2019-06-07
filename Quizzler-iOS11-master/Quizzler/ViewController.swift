//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer = false
    var questionNumber:Int = 0
    var score:Int = 0
    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
        updateUI()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject)
    {
        if sender.tag == 1
        {
            pickedAnswer = true
        }
        else if sender.tag == 2
        {
            pickedAnswer = false
        }
        checkAnswer()
        nextQuestion()
        
    }
    
    
    func updateUI()
    {
       scoreLabel.text = "\(score)"
        progressLabel.text = "\(questionNumber) / 12"
        progressBar.frame.size.width = ((view.frame.size.width) / 12) * CGFloat(questionNumber)
      
    }
    

    func nextQuestion()
    {
        if ((questionNumber+1) == allQuestions.list.count)
        {
            let alert = UIAlertController(title: "Complete", message: "You just finished the quiz", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart?", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert,animated: true,completion: nil)
            
        }
        else
        {
        questionNumber+=1
        questionLabel.text = allQuestions.list[questionNumber].questionText
        }
        
    }
    
    
    func checkAnswer()
    {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if correctAnswer == pickedAnswer
        {
            ProgressHUD.showSuccess("Correct")
            score+=1
            updateUI()
            
        }
        else
        {
            ProgressHUD.showError("Wrong!")
            updateUI()
        }
    }
    
    
    func startOver()
    {
        questionNumber = 0
        score = 0
        nextQuestion()
        updateUI()
       
    }
    

    
}
