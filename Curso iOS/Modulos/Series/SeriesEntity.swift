//
//  SeriesEntity.swift
//  Curso iOS
//
//  Created Fatima Ramirez on 23/11/23.
//  2023 ___ORGANIZATIONNAME___.
//

import Foundation

public struct Series {
    
    let question: String
    let answer1: String
    let answer2: String
    let answer3: String
    
    public static let quizzSeries = [
        Series(question: "Como se llama su serie?", answer1: "Stranger Things", answer2: "Cosas sobresalientes", answer3: "Cosas extrañas"),
        Series(question: "Su serie se estrenó este año?", answer1: "No", answer2: "si", answer3: "fue hace dos años"),
        Series(question: "Esta serie estaba en Netflix?", answer1: "si", answer2: "no", answer3: "no lo se"),
        Series(question: "En que pais se filmó esta Serie?", answer1: "Mexico", answer2: "Colombia", answer3: "España"),
        Series(question: "Los vikingos son de..", answer1: "Dinamarca", answer2: "Canada", answer3: "Noruega")
    ]
    
    static let series: Array = ["strangerThings", "merlina", "game", "elite", "vikingos"]
    
    static let numberSeries: Array = [1, 2, 3, 4, 5]
    
    static let anwersSeries: Array = [1, 2, 2, 3, 3]
    
    static var questionSeries = 0
    
}
