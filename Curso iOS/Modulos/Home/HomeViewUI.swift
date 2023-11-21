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
        navigationController.translatesAutoresizingMaskIntoConstraints = false
        navigationController.backgroundColor = UIColor(cgColor: CGColor(red: 255/255, green: 203/255, blue: 219/255, alpha: 1))
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
    var label1: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Didot", size: 50)
        label.text = "Hello world"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Boton
    var button1: UIButton = {
        let configButton = UIButton()
        configButton.backgroundColor = .systemPink
        configButton.setTitle("Boton 1", for: .normal)
        configButton.layer.cornerRadius = 20
        configButton.translatesAutoresizingMaskIntoConstraints = false
        return configButton
    }()
    
    var button2: UIButton = {
        let configButton = UIButton()
        configButton.backgroundColor = .systemPink
        configButton.setTitle("Boton 2", for: .normal)
        configButton.layer.cornerRadius = 20
        configButton.translatesAutoresizingMaskIntoConstraints = false
        return configButton
    }()
    
    var button3: UIButton = {
        let configButton = UIButton()
        configButton.backgroundColor = .systemPink
        configButton.setTitle("Boton 3", for: .normal)
        configButton.layer.cornerRadius = 20
        configButton.translatesAutoresizingMaskIntoConstraints = false
        return configButton
    }()
    
    var delegate: HomeViewUIDelegate?
    var navigationController: UINavigationController?
    
    public convenience init(navigation: UINavigationController, delegate: HomeViewUIDelegate){
        self.init()
        self.delegate = delegate
        self.navigationController = navigation
            
            setupUIElements()
            setupConstraints()
            
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setupUIElements(){
        self.addSubview(navigationBar)
        addSubview(contentView)
        contentView.addSubview(label1)
        contentView.addSubview(button1)
        contentView.addSubview(button2)
        contentView.addSubview(button3)
    }
    
    func setupConstraints () {
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: self.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            label1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            label1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            button1.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 70),
            button1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            button1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            button1.heightAnchor.constraint(equalToConstant: 40),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 30),
            button2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            button2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            button2.heightAnchor.constraint(equalToConstant: 40),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 30),
            button3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            button3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            button3.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }

}




