//
//  CharacterViewUI.swift
//  Curso iOS
//
//  Created Fatima Ramirez on 22/11/23.
//  2023 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit

protocol CharacterViewUIDelegate {
    
}

class CharacterViewUI: UIView{
    //MARK: ELEMENTOS:
    private lazy var navigationBar: UINavigationBar = {
        let navigationController = UINavigationBar(frame: .zero)
        navigationController.translatesAutoresizingMaskIntoConstraints = false
        navigationController.backgroundColor = .red //UIColor(cgColor: CGColor(red: 255/255, green: 203/255, blue: 219/255, alpha: 1))
        return navigationController
    }()
    
    //View
    private lazy var contentView: UIView = {
        let scrollview = UIView(frame: .zero)
        scrollview.backgroundColor = UIColor(cgColor: CGColor(red: 255/255, green: 203/255, blue: 219/255, alpha: 1))
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    
    // CardView
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Label
    public var label1: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Chalkboard SE", size: 50)
        label.text = "Personajes"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var delegate: CharacterViewUIDelegate?
    var navigationController: UINavigationController?
    
    public convenience init(
        navigation: UINavigationController,
        delegate: CharacterViewUIDelegate){
            self.init()
            self.delegate = delegate
            self.navigationController = navigation
            
            setupElements()
            setupConstraints()
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupElements(){
        addSubview(navigationBar)
        addSubview(contentView)
        contentView.addSubview(label1)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: self.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            label1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            label1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            label1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
        ])
    }

}




