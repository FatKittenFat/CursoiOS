//
//  CharacterEntity.swift
//  Curso iOS
//
//  Created Fatima Ramirez on 22/11/23.
//  2023 ___ORGANIZATIONNAME___.
//

import Foundation

public struct Characters {
    
    let question: String
    let answer1: String
    let answer2: String
    let answer3: String
    
    public static let quizzCharacter = [
        Characters(question: "Como se llama este personaje?", answer1: "Duende Verde", answer2: "Linterna Verde", answer3: "Shrek"),
        Characters(question: "Se llama Ariel?", answer1: "No", answer2: "si", answer3: "no, es Aurora"),
        Characters(question: "Como se llaman ellos dos? ", answer1: "Raton 1 y Raton 2", answer2: "Jaq y Guz", answer3: "Serpiente y Escalera"),
        Characters(question: "Que tortuga ninja es?", answer1: "Leonardo", answer2: "Miguel Angel", answer3: "Rafael"),
        Characters(question: "El es...", answer1: "Scooby doo", answer2: "Kripto", answer3: "Coraje")
    ]
    
    static let characters: Array = ["DuendeVerde", "Ariel", "Cenicienta", "Tortuga", "Coraje"]
    
    static let numberCharacter: Array = [1, 2, 3, 4, 5]
    
    static let anwersCharacter: Array = [1, 2, 2, 1, 3]
    
    static var questionCharacter = 0
    
}
