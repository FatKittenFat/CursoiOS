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
import CLTypingLabel

protocol HomeViewUIDelegate {
    func goToSeries()
    func goToCharacterViewUI()
    func goToMovieViewUI()
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
    public var label1: CLTypingLabel  = {
        let label = CLTypingLabel()
        label.charInterval = 0.1
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont(name: "Marker Felt", size: 50)
        label.text = "Adivina con FLORK :)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var imageHome: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "Inicio")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // Boton
    var movieButton: UIButton = {
        let configButton = UIButton()
        configButton.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
        configButton.setTitle("Pelicula", for: .normal)
        configButton.layer.cornerRadius = 10
        configButton.addTarget(self, action: #selector(movieFunc), for: .touchUpInside)
        configButton.translatesAutoresizingMaskIntoConstraints = false
        return configButton
    }()
    
    var seriesButton: UIButton = {
        let configButton = UIButton()
        configButton.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
        configButton.setTitle("Serie", for: .normal)
        configButton.layer.cornerRadius = 10
        configButton.addTarget(self, action: #selector(seriesFunc), for: .touchUpInside)
        configButton.translatesAutoresizingMaskIntoConstraints = false
        return configButton
    }()
    
    var characterButton: UIButton = {
        let configButton = UIButton()
        configButton.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
        configButton.setTitle("Personaje", for: .normal)
        configButton.layer.cornerRadius = 10
        configButton.addTarget(self, action: #selector(characterFunc), for: .touchUpInside)
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
        contentView.addSubview(imageHome)
        contentView.addSubview(movieButton)
        contentView.addSubview(seriesButton)
        contentView.addSubview(characterButton)
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
            
            label1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            label1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            label1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            label1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            imageHome.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 30),
            imageHome.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            imageHome.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            imageHome.heightAnchor.constraint(equalToConstant: 270),
            imageHome.widthAnchor.constraint(equalToConstant: 270),
            
            movieButton.topAnchor.constraint(equalTo: imageHome.bottomAnchor, constant: 30),
            movieButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            movieButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            movieButton.heightAnchor.constraint(equalToConstant: 40),
            
            seriesButton.topAnchor.constraint(equalTo: movieButton.bottomAnchor, constant: 30),
            seriesButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            seriesButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            seriesButton.heightAnchor.constraint(equalToConstant: 40),
            
            characterButton.topAnchor.constraint(equalTo: seriesButton.bottomAnchor, constant: 30),
            characterButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            characterButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            characterButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }

    @objc func seriesFunc() {
        delegate?.goToSeries()
    }
    
    @objc func characterFunc() {
        delegate?.goToCharacterViewUI()
    }
    
    @objc func movieFunc(){
        delegate?.goToMovieViewUI()
        
    }
}




