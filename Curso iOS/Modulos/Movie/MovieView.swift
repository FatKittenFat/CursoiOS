//
//  MovieView.swift
//  Curso iOS
//
//  Created Fatima Ramirez on 22/11/23.
//  2023 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit
class MovieView: UIViewController {
    var presenter: MoviePresenterProtocol?
    private var ui: MovieViewUI?
    
    override func loadView() {
        ui = MovieViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        view = ui
    }
    
}

extension MovieView: MovieViewProtocol {
    func quizzMovie() {
    }
    
    
}

extension MovieView: MovieViewUIDelegate {
    func quizzMovieViewUI() {
    }
    
    
    
}
