//
//  HomeView.swift
//  Curso iOS
//
//  Created Fatima Ramirez on 13/11/23.
//  2023 ___ORGANIZATIONNAME___.
//
// LOGICA DE ELEMENTOS QUE SE HICIERON EN VIEWUI
// SE COMUNICA CON PRESENTER
//
//import Foundation
import UIKit

class HomeView: UIViewController {
    var presenter: HomePresenterProtocol?
    private var ui: HomeViewUI?
    var x = 1
    
    override func loadView() {
        
        ui = HomeViewUI(navigation: self.navigationController!,delegate: self)
        view = ui
    }
    
}

extension HomeView: HomeViewProtocol {
    func notifyError(code: Int) {
        ui?.label1.text = String(code)
        ui?.label1.textColor = .red
        print("notify error")
    }
    
    
}

// ViewUI -> View
extension HomeView: HomeViewUIDelegate {
    func goToSeries() {
        presenter?.goToSeriesPresenter()
    }
      
    func goToCharacterViewUI(){
        presenter?.goToCharacterPresenter()
    }
    
    func goToMovieViewUI() {
        presenter?.goToMoviePresenter()
    }
    
}
