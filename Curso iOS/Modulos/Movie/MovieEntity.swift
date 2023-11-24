//
//  MovieEntity.swift
//  Curso iOS
//
//  Created Fatima Ramirez on 22/11/23.
//  2023 ___ORGANIZATIONNAME___.
//

import Foundation

struct Question {
    
    let question: String
    let answer: String
    
    init (q: String, a: String){
        question = q
        answer = a
    }
}

struct Quizz {
    let quizz = Question(q: "Su pelicula es Scary Movie", a: "True")
    var questionNumber = 0
    
    func checkAnswer(userAnswer: String) -> Bool{
        if userAnswer == quizz.answer {
            return true
        } else {
            return false
        }
    }
    
    func questionMovie() -> String {
        return quizz.question
    }
    
}

