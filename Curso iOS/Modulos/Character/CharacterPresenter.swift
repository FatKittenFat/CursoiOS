//
//  CharacterPresenter.swift
//  Curso iOS
//
//  Created Fatima Ramirez on 22/11/23.
//  2023 ___ORGANIZATIONNAME___.
//

import Foundation
class CharacterPresenter {
    var interactor: CharacterInteractorProtocol?
    weak var view: CharacterViewProtocol?
    var router: CharacterRouterProtocol?
    
}



extension CharacterPresenter: CharacterPresenterProtocol {
    
}
