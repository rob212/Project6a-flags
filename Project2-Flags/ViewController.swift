//
//  ViewController.swift
//  Project2-Flags
//
//  Created by Robert McBryde on 12/09/2015.
//  Copyright © 2015 Robert McBryde. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    // MARK: initialzation 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","spain","uk","us"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGrayColor().CGColor
        button1.layer.borderColor = UIColor.lightGrayColor().CGColor
        button3.layer.borderColor = UIColor.lightGrayColor().CGColor
        updateScore(increment: 0)
        askQuestion()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: Custom functions
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        button3.setImage(UIImage(named: countries[2]), forState: .Normal)
        correctAnswer = Int(arc4random_uniform(3))
        title = countries[correctAnswer].uppercaseString
    }

    @IBAction func buttonTapped(sender: UIButton) {
        var title : String
        
        if sender.tag == correctAnswer {
            title = "Correct"
             updateScore(increment: 1)
        } else {
            title = "Wrong"
             updateScore(increment: -1)
        }
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
        presentViewController(ac, animated: true, completion: nil)
    }
    
    func updateScore(increment value: Int){
        if value > 0 {
            ++score
        } else if value < 0 {
            --score
        }
        scoreLabel.text = "score: \(score)"
    }
    
}

