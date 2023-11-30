//
//  MovieEntity.swift
//  Curso iOS
//
//  Created Fatima Ramirez on 22/11/23.
//  2023 ___ORGANIZATIONNAME___.
//

import Foundation

public struct Question {

    let question: String
    let answer1: String
    let answer2: String
    let answer3: String
    
    public static let quizz = [
        Question(question: "A que Pelicula pertenece?", answer1: "El Resplandor", answer2: "Scary movie", answer3: "Pelicula de miedo"),
        Question(question: "Su pelicula es It?", answer1: "Si", answer2: "No", answer3: "que miedo!!"),
        Question(question: "Como se llama su pelicula?", answer1: "El Padrino", answer2: "Parasitos", answer3: "ScarFace"),
        Question(question: "En ingles su pelicula es:", answer1: "Your Mind", answer2: "Inside my mind", answer3: "Inside Out"),
        Question(question: "Su estudio de animacion es Pixar?", answer1: "Si", answer2: "no", answer3: "No estoy seguro")
    ]
    public static var questionNumber = 0
    
    public static let answers: Array = [2, 1, 1, 3, 2]
    
    public static var numberQuestion = [1, 2, 3, 4 ,5]
    
    
    public static let imagesMovies: Array = ["ScaryMovie", "It", "Padrino", "InsideOut", "Shrek"]
}

