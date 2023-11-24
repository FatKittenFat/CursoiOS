//
//  SeriesView.swift
//  Curso iOS
//
//  Created Fatima Ramirez on 23/11/23.
//  2023 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit
class SeriesView: UIViewController {
    var presenter: SeriesPresenterProtocol?
    private var ui: SeriesViewUI?
    
    
    override func loadView() {
        ui = SeriesViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        view = ui
    }
    
}

extension SeriesView: SeriesViewProtocol {
    
}

extension SeriesView: SeriesViewUIDelegate {
    
}
