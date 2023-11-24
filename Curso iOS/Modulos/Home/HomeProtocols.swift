//
//  HomeProtocols.swift
//  Curso iOS
//
//  Created Fatima Ramirez on 13/11/23.
//  2023 ___ORGANIZATIONNAME___.
//
//
// TODO CONJUNTO DE PROTOCOLOS Y DELEGADOS
// 

import Foundation
// conecta de presenter a view
protocol HomeViewProtocol: class {
    func notifyError(code: Int)
}

// presenter a interactor
protocol HomeInteractorProtocol: class {
    func goToSeries()
    func goToCharacter()
    func goToMovie()
}

// view a presenter
protocol HomePresenterProtocol: class {
    func goToSeriesPresenter()
    func successSeries (msg: String)
    func error(code: Int)
    
    func goToCharacterPresenter()
    func successCharacter(msg: String)
    
    func goToMoviePresenter()
    func successMovie(msg: String)
}


protocol HomeRouterProtocol: class {
    // comunica a sig pantalla
    func goToSeries(msg: String)
    func goToCharacter()
    func goToMovie()
}
