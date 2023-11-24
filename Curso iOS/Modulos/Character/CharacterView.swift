//
//  CharacterView.swift
//  Curso iOS
//
//  Created Fatima Ramirez on 22/11/23.
//  2023 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit
class CharacterView: UIViewController {
    var presenter: CharacterPresenterProtocol?
    private var ui: CharacterViewUI?
    
    
    override func loadView() {
        ui = CharacterViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        view = ui
    }
    
}

extension CharacterView: CharacterViewProtocol {
    
}

extension CharacterView: CharacterViewUIDelegate {
    
}
