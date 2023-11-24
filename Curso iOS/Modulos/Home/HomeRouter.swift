//
//  HomeRouter.swift
//  Curso iOS
//
//  Created Fatima Ramirez on 13/11/23.
//  2023 ___ORGANIZATIONNAME___.
//
// MANDAR A MODULOS
// 

import Foundation
import UIKit

class HomeRouter{
    var navigation: UINavigationController?
    
}

extension HomeRouter: HomeRouterProtocol{
    func goToMovie() {
        let moduleMovie = MovieMain.createModule(navigation: navigation!)
        navigation?.pushViewController(moduleMovie, animated: true)
    }
    
    func goToSeries(msg: String) {
        // pasar a la siguiente pantalla // hacer navegacion
        let moduleSeries = SeriesMain.createModule(navigation: navigation!)
        navigation?.pushViewController(moduleSeries, animated: true)
        
    }
    
    func goToCharacter(){
        let moduleChar = CharacterMain.createModule(navigation: navigation!)
        navigation?.pushViewController(moduleChar, animated: true)
    }
    
    
}
