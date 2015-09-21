//
//  ViewController.swift
//  TvDemo
//
//  Created by Erik Dungan on 9/19/15.
//  Copyright © 2015 Under100. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choiceA: UIButton!
    @IBOutlet weak var choiceB: UIButton!
    @IBOutlet weak var choiceC: UIButton!
    
    var currentAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generateQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitAnswer(sender: UIButton) {
        let submittedAnswer = Int((sender.titleLabel?.text)!)
        if submittedAnswer == self.currentAnswer {
            self.questionLabel.text = "Great Job!"
        } else {
            self.questionLabel.text = "Ahhh, not quite"
        }
        let _ = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateQuestion", userInfo: nil, repeats: false)
    }
    
    
    func generateQuestion() {
        let a1 = Int(arc4random_uniform(12))
        let a2 = Int(arc4random_uniform(12))
        let answer = a1 + a2
        self.currentAnswer = Int(answer)
        let wrongAnswerA = answer + Int(arc4random_uniform(4)) + 1
        var wrongAnswerB = answer - 2 + Int(arc4random_uniform(4))
        while wrongAnswerB == answer || wrongAnswerB == wrongAnswerA || wrongAnswerB < 0 {
            wrongAnswerB = answer - 2 + Int(arc4random_uniform(4))
        }
        var answerSet = [answer, wrongAnswerA, wrongAnswerB]
        answerSet.shuffleInPlace()
        self.choiceA.setTitle(String(answerSet[0]), forState: UIControlState.Normal)
        self.choiceB.setTitle(String(answerSet[1]), forState: UIControlState.Normal)
        self.choiceC.setTitle(String(answerSet[2]), forState: UIControlState.Normal)
        self.questionLabel.text = String(a1) + " + " + String(a2) + " ="
    }


}

