//
//  CharacterMain.swift
//  Curso iOS
//
//  Created Fatima Ramirez on 22/11/23.
//  2023 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit

open class CharacterMain{
    public static func createModule(navigation: UINavigationController) -> UIViewController {
        let viewController: CharacterView? = CharacterView()
        if let view = viewController {
            let presenter = CharacterPresenter()
            let router = CharacterRouter()
            let interactor = CharacterInteractor()
            
            
             view.presenter = presenter
             
             presenter.view = view
             presenter.interactor = interactor
             presenter.router = router
             
             router.navigation = navigation
             
             interactor.presenter = presenter
            return view
        }
        return UIViewController()
    }
    
    
}
