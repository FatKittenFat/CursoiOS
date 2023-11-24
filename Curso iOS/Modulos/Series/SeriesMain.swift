//
//  SeriesMain.swift
//  Curso iOS
//
//  Created Fatima Ramirez on 23/11/23.
//  2023 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit

open class SeriesMain{
    public static func createModule(navigation: UINavigationController) -> UIViewController {
        let viewController: SeriesView? = SeriesView()
        if let view = viewController {
            let presenter = SeriesPresenter()
            let router = SeriesRouter()
            let interactor = SeriesInteractor()
            
            
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
