//
//  Question.swift
//  aedesChallenge
//
//  Created by Jinpls on 14/05/24.
//

import Foundation

class Question {
    let questionText: String
    let answers:[String]
    let correctAnswer: Int
 
    
    init(questionText: String, answers: [String], correctAnswer: Int) {
        self.questionText = questionText
        self.answers = answers
        self.correctAnswer = correctAnswer
      
    }
}
