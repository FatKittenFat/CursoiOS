//
//  HomeInteractor.swift
//  Curso iOS
//
//  Created Fatima Ramirez on 13/11/23.
//  2023 ___ORGANIZATIONNAME___.
//
// CONSULTAS A API // BASE DE DATOS 
//

import Foundation
class HomeInteractor{
    var presenter: HomePresenterProtocol?
    
}

extension HomeInteractor: HomeInteractorProtocol {
    func goToSeries() {
        presenter?.successSeries(msg: "Comuncicacion a series bien")
    }
    
    func goToMovie() {
        presenter?.successMovie(msg: "Comunicacion a peliculas bien")
    }
    
    func goToCharacter() {
        presenter?.successCharacter(msg: "Comunicacion a personajes bien")
    }
    
}
