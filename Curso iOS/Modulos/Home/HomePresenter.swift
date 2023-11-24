//
//  HomePresenter.swift
//  Curso iOS
//
//  Created Fatima Ramirez on 13/11/23.
//  2023 ___ORGANIZATIONNAME___.
//
//  COMUNICACION CON EL ROUTER
//

import Foundation
class HomePresenter {
    var interactor: HomeInteractorProtocol?
    weak var view: HomeViewProtocol?
    var router: HomeRouterProtocol?
    
}



extension HomePresenter: HomePresenterProtocol {
    
    func error(code: Int) {
        // errores de api , servidor , base de datos
        // comunicamos al router que hay un error
        view?.notifyError(code: code)
    }
    
    func successSeries(msg: String) {
        // comunicamos a router que pase a la sig pantalla
        router?.goToSeries(msg: msg)
        
    }
    
    func goToSeriesPresenter() {
        interactor?.goToSeries()
    }
    
    func goToCharacterPresenter () {
        interactor?.goToCharacter()
        
    }
    func successCharacter(msg: String){
        router?.goToCharacter()
    }
    
    func successMovie(msg: String){
        router?.goToMovie()
    }
    
    func goToMoviePresenter (){
        interactor?.goToMovie()
    }
    
    
    
}
