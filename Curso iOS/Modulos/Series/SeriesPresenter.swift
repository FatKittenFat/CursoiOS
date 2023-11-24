//
//  SeriesPresenter.swift
//  Curso iOS
//
//  Created Fatima Ramirez on 23/11/23.
//  2023 ___ORGANIZATIONNAME___.
//

import Foundation
class SeriesPresenter {
    var interactor: SeriesInteractorProtocol?
    weak var view: SeriesViewProtocol?
    var router: SeriesRouterProtocol?
    
}



extension SeriesPresenter: SeriesPresenterProtocol {
    
}
