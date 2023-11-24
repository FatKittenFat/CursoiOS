//
//  MoviePresenter.swift
//  Curso iOS
//
//  Created Fatima Ramirez on 22/11/23.
//  2023 ___ORGANIZATIONNAME___.
//

import Foundation
class MoviePresenter {
    var interactor: MovieInteractorProtocol?
    weak var view: MovieViewProtocol?
    var router: MovieRouterProtocol?
    
}



extension MoviePresenter: MoviePresenterProtocol {
    func quizzMoviePresenter() {
        <#code#>
    }
    
    
}
