//
//  HomeViewUI.swift
//  Curso iOS
//
//  Created Fatima Ramirez on 13/11/23.
//  2023 ___ORGANIZATIONNAME___.
//
//
//
// aqui se van a crear componentes y logica de interfaz

import UIKit

protocol HomeViewUIDelegate {
    
}

class HomeViewUI: UIView{
    //Navigation Bar
    private lazy var navigationBar: UINavigationBar = {
        let navigationController = UINavigationBar(frame: .zero)
        navigationController.backgroundColor = UIColor(cgColor: CGColor(red: 255/255, green: 203/255, blue: 219/255, alpha: 1))
        navigationController.translatesAutoresizingMaskIntoConstraints = false
        return navigationController
    }()
    //View
    private lazy var contentView: UIView = {
        let scrollview = UIView(frame: .zero)
        scrollview.backgroundColor = .white
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
    
    // Boton
    var button1: UIButton = {
        let configButton = UIButton()
        configButton.backgroundColor = .systemPink
        configButton.setTitle("Boton 1", for: .normal)
        configButton.translatesAutoresizingMaskIntoConstraints = false
        return configButton
    }()
    // Label
    var label1: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Comic Sans", size: 20)
        label.text = "Hello world"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var delegate: HomeViewUIDelegate?
    var navigationController: UINavigationController?
    
    public convenience init(
        navigation: UINavigationController,
        delegate: HomeViewUIDelegate){
        self.init()
        self.delegate = delegate
        self.navigationController = navigation
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setupUIElements (){
        addSubview(navigationBar)
        addSubview(contentView)
        contentView.addSubview(cardView) // pinta elementos
        cardView.addSubview(label1)
        cardView.addSubview(button1)
    }
    
    func setupConstraints () {
        NSLayoutConstraint.activate([
        
        ])
    }

}




