//
//  QuestionController.swift
//  aedesChallenge
//
//  Created by Jinpls on 14/05/24.
//

import Foundation
import UIKit

class QuestionController: UIViewController{
    @IBOutlet weak var questionImage: UIImageView!
    
    @IBOutlet weak var currentQuestion: UILabel!
    @IBOutlet weak var currentScore: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    @IBOutlet weak var questionText: UILabel!
    
    var questions: [Question] = [ Question(questionText: "Qual è il più grande oceano del mondo?", answers: ["Atlantico", "Pacifico", "Indiano", "Artico"], correctAnswer: 1),
                                   Question(questionText: "Qual è il più piccolo oceano del mondo?", answers: ["Atlantico", "Pacifico", "Indiano", "Artico"], correctAnswer: 2)]
    var questionIndex = 0
    var totalQuestions = 0
    var score = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        answer1.tag = 0
        answer2.tag = 1
        answer3.tag = 2
        answer4.tag = 3
        showNextQuestion()
        
        
    }
    
    func showNextQuestion() {
        guard questionIndex < questions.count else {
            // Se non ci sono più domande, esegui il ritorno al main menu
            returnToMainMenu()
            return
        }
        
        let currentQuestion = questions[questionIndex]
        updateUI(with: currentQuestion)
        
    }
    
    //metodo per aggiornare il controller
    func updateUI(with question: Question) {
        currentQuestion.text = question.questionText
        
        answer1.setTitle(question.answers[0], for: .normal)
        answer2.setTitle(question.answers[1], for: .normal)
        answer3.setTitle(question.answers[2], for: .normal)
        answer4.setTitle(question.answers[3], for: .normal)
        
        answer1.backgroundColor = .clear
        answer2.backgroundColor = .clear
        answer3.backgroundColor = .clear
        answer4.backgroundColor = .clear
    }
    
    @IBAction func answerTapped(_ sender: UIButton) {
        guard questionIndex < questions.count else {
            return
        }
        
        let selectedAnswerIndex = sender.tag
        
        let currentQuestion = questions[questionIndex]
        
        if selectedAnswerIndex == currentQuestion.correctAnswer {
            score += 50
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
            
            let correctAnswer = currentQuestion.answers[currentQuestion.correctAnswer]
            let alert = UIAlertController(title: "Risposta errata", message: "La risposta corretta è \(correctAnswer)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.questionIndex += 1

            self.showNextQuestion()
        }
    }
    func returnToMainMenu() {
        navigationController?.popToRootViewController(animated: true)
        //controllo lo score attuale vs il vecchio score
        let defaults = UserDefaults.standard
        defaults.set(score, forKey:"currentScore")
        
    }
    
    
    
}

