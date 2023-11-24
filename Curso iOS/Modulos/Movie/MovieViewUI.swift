//
//  MovieViewUI.swift
//  Curso iOS
//
//  Created Fatima Ramirez on 22/11/23.
//  2023 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit

protocol MovieViewUIDelegate {
    func quizzMovieViewUI()
}

class MovieViewUI: UIView{
    
    private lazy var navigation: UINavigationBar = {
        let navigationConfig = UINavigationBar(frame: .zero)
        navigationConfig.backgroundColor = UIColor(cgColor: CGColor(red: 204/255, green: 169/255, blue: 221/255, alpha: 1))
        navigationConfig.translatesAutoresizingMaskIntoConstraints = false
        return navigationConfig
    }()
    
    private lazy var contentView: UIView = {
        let scrollview = UIView(frame: .zero)
        scrollview.backgroundColor = UIColor(cgColor: CGColor(red: 204/255, green: 169/255, blue: 221/255, alpha: 1))
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    
    public var title: UILabel = {
        let label = UILabel()
        label.text = "Pelicula"
        label.font = UIFont(name: "Chalkboard SE", size: 50)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var imageMovie: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "ScaryMovie.jpg")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var button1: UIButton = {
        let configButton = UIButton()
        configButton.backgroundColor = .systemPink
        configButton.setTitle("Respuesta 1", for: .normal)
        configButton.layer.cornerRadius = 10
        configButton.translatesAutoresizingMaskIntoConstraints = false
        return configButton
    }()
    
    var button2: UIButton = {
        let configButton = UIButton()
        configButton.backgroundColor = .systemPink
        configButton.setTitle("Respuesta 2", for: .normal)
        configButton.layer.cornerRadius = 10
        configButton.translatesAutoresizingMaskIntoConstraints = false
        return configButton
    }()

    var button3: UIButton = {
        let configButton = UIButton()
        configButton.backgroundColor = .systemPink
        configButton.setTitle("Respuesta 3", for: .normal)
        configButton.layer.cornerRadius = 10
        configButton.translatesAutoresizingMaskIntoConstraints = false
        return configButton
    }()
    
    var delegate: MovieViewUIDelegate?
    var navigationController: UINavigationController?
    
    public convenience init(
        navigation: UINavigationController, delegate: MovieViewUIDelegate) {
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
        addSubview(navigation)
        addSubview(contentView)
        contentView.addSubview(title)
        contentView.addSubview(imageMovie)
        contentView.addSubview(button1)
        contentView.addSubview(button2)
        contentView.addSubview(button3)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            navigation.topAnchor.constraint(equalTo: self.topAnchor),
            navigation.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            navigation.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: navigation.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            imageMovie.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 50),
            imageMovie.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageMovie.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            imageMovie.heightAnchor.constraint(equalToConstant: 270),
            imageMovie.widthAnchor.constraint(equalToConstant: 270),
            
            button1.topAnchor.constraint(equalTo: imageMovie.bottomAnchor, constant: 40),
            button1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            button1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            button1.heightAnchor.constraint(equalToConstant: 40),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 40),
            button2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            button2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            button2.heightAnchor.constraint(equalToConstant: 40),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 40),
            button3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            button3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            button3.heightAnchor.constraint(equalToConstant: 40),

        ])
        
    }

}




