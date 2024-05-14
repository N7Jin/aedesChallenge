//
//  ViewController.swift
//  aedesChallenge
//
//  Created by Jinpls on 14/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var logoView: UIImageView!
    
    var highScore: Int = 0
    var currentQuestion = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateScore()
        
        
    }
    func updateScore(){
        let defaults = UserDefaults.standard
        defaults.set(highScore, forKey: "highScore")
        let savedScore = defaults.integer(forKey: "currentScore")
        if savedScore > highScore { // lo score
            defaults.set(savedScore, forKey: "highScore")
        }
        scoreLabel.text = "High score: " + "\(savedScore)"
        
        
    }
    
    @IBAction func startTapped(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Start" {
            if let questionVC = segue.destination as? QuestionController {
                
            }
        }
        
        
    }
}


