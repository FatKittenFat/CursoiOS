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
    
    let quizz = [
        Question(question: "A que Pelicula pertenece?", answer1: "El Resplandor", answer2: "Scary movie", answer3: "Pelicula de miedo"),
        Question(question: "Su pelicula es It?", answer1: "Si", answer2: "No", answer3: "que miedo!!")
    ]
    var questionNumber = 0
    
    let answers: Array = [2, 2]
    
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
        label.text = "Cuantas peliculas conoces?"
        label.numberOfLines = 2
        label.font = UIFont(name: "Chalkboard SE", size: 40)
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
    
    var buttonStart: UIButton = {
        let configButton = UIButton()
        configButton.backgroundColor = .systemPink
        configButton.setTitle("Comencemos :)", for: .normal)
        configButton.layer.cornerRadius = 10
        configButton.addTarget(self, action: #selector(startQuizz), for: .touchUpInside)
        configButton.translatesAutoresizingMaskIntoConstraints = false
        return configButton
    }()
    
    var button1: UIButton = {
        let configButton = UIButton()
        configButton.backgroundColor = .systemPink
        //configButton.setTitle(" ", for: .normal)
        configButton.layer.cornerRadius = 10
        configButton.isEnabled = false
        configButton.isHidden = true
        configButton.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
        configButton.translatesAutoresizingMaskIntoConstraints = false
        return configButton
    }()
    
    var button2: UIButton = {
        let configButton = UIButton()
        configButton.backgroundColor = .systemPink
        configButton.isEnabled = false
        configButton.isHidden = true
        //configButton.setTitle(" ", for: .normal)
        configButton.layer.cornerRadius = 10
        configButton.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
        configButton.translatesAutoresizingMaskIntoConstraints = false
        return configButton
    }()

    var button3: UIButton = {
        let configButton = UIButton()
        configButton.backgroundColor = .systemPink
        configButton.isEnabled = false
        configButton.isHidden = true
        //configButton.setTitle(" ", for: .normal)
        configButton.layer.cornerRadius = 10
        configButton.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
        configButton.translatesAutoresizingMaskIntoConstraints = false
        return configButton
    }()
    
    var nextButton: UIButton = {
        let configButton = UIButton()
        configButton.backgroundColor = .systemPink
        configButton.isEnabled = false
        configButton.isHidden = true
        configButton.setTitle("Siguiente pregunta", for: .normal)
        configButton.layer.cornerRadius = 10
        configButton.addTarget(self, action: #selector(nextQuestion), for: .touchUpInside)
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
        contentView.addSubview(buttonStart)
        contentView.addSubview(nextButton)
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
            
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            imageMovie.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 15),
            imageMovie.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageMovie.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            imageMovie.heightAnchor.constraint(equalToConstant: 270),
            imageMovie.widthAnchor.constraint(equalToConstant: 270),
            
            buttonStart.topAnchor.constraint(equalTo: imageMovie.bottomAnchor, constant: 20),
            buttonStart.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            buttonStart.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            buttonStart.heightAnchor.constraint(equalToConstant: 40),
            
            button1.topAnchor.constraint(equalTo: buttonStart.bottomAnchor, constant: 20),
            button1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            button1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            button1.heightAnchor.constraint(equalToConstant: 40),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 20),
            button2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            button2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            button2.heightAnchor.constraint(equalToConstant: 40),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 20),
            button3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            button3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            button3.heightAnchor.constraint(equalToConstant: 40),
            
            nextButton.topAnchor.constraint(equalTo: button3.bottomAnchor, constant: 20),
            nextButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 150),
            nextButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            nextButton.heightAnchor.constraint(equalToConstant: 40),

        ])
        
    }
    
    @objc func startQuizz () {
        print("start Quizz")
        
        title.text = quizz[questionNumber].question
        
        buttonStart.isEnabled = false
        buttonStart.isHidden = true
        
        button1.isHidden = false
        button1.isEnabled = true
        button1.setTitle(quizz[questionNumber].answer1, for: .normal)
        
        button2.isHidden = false
        button2.isEnabled = true
        button2.setTitle(quizz[questionNumber].answer2, for: .normal)
        
        button3.isHidden = false
        button3.isEnabled = true
        button3.setTitle(quizz[questionNumber].answer3, for: .normal)
        
//        nextButton.isHidden = true
//        nextButton.isEnabled = false

    }
    
    @objc func nextQuestion(){
        if questionNumber + 1 < quizz.count {
            questionNumber += 1
            title.text = quizz[questionNumber].question
            button1.setTitle(quizz[questionNumber].answer1, for: .normal)
            button2.setTitle(quizz[questionNumber].answer2, for: .normal)
            button3.setTitle(quizz[questionNumber].answer3, for: .normal)
            
            button1.backgroundColor = .systemPink
            button2.backgroundColor = .systemPink
            button3.backgroundColor = .systemPink
            
            nextButton.isHidden = true
            nextButton.isEnabled = false
            
        } else {
            title.text = "Terminaste las preguntas"
            
            button1.isHidden = true
            button1.isEnabled = false
            
            button2.isHidden = true
            button2.isEnabled = false
            
            button3.isHidden = true
            button3.isEnabled = false
            
            nextButton.isHidden = true
            nextButton.isEnabled = false
        }
        
    }
    
    @objc func checkAnswer(_ sender: UIButton){
        let userAnswer = sender.currentTitle
        let Question1 = quizz[questionNumber].answer2
        if Question1 == userAnswer {
            button2.backgroundColor = .green
            button1.isEnabled = false
            button1.backgroundColor = .darkGray
            button3.isEnabled = false
            button3.backgroundColor = .darkGray
            
            print("Respuesta correcta")
        } else {
            sender.backgroundColor = .red
            button2.backgroundColor = .green
            sender.isEnabled = false
            print("Respuesta incorrecta")
        }
        
        nextButton.isEnabled = true
        nextButton.isHidden = false
        
    }
    
}




