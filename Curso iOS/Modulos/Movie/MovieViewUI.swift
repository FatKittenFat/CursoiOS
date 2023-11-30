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
        label.text = "Cuantas peliculas conoces?"
        label.numberOfLines = 3
        label.font = UIFont(name: "Marker Felt", size: 30)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var imageMovie: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pregunta")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var buttonStart: UIButton = {
        let configButton = UIButton()
        configButton.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
        configButton.setTitle("Comencemos :)", for: .normal)
        configButton.layer.cornerRadius = 10
        configButton.addTarget(self, action: #selector(startQuizz), for: .touchUpInside)
        configButton.translatesAutoresizingMaskIntoConstraints = false
        return configButton
    }()
    
    var button1: UIButton = {
        let configButton = UIButton()
        configButton.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
        configButton.layer.cornerRadius = 10
        configButton.isEnabled = false
        configButton.isHidden = true
        configButton.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
        configButton.translatesAutoresizingMaskIntoConstraints = false
        return configButton
    }()
    
    var button2: UIButton = {
        let configButton = UIButton()
        configButton.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
        configButton.isEnabled = false
        configButton.isHidden = true
        configButton.layer.cornerRadius = 10
        configButton.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
        configButton.translatesAutoresizingMaskIntoConstraints = false
        return configButton
    }()

    var button3: UIButton = {
        let configButton = UIButton()
        configButton.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
        configButton.isEnabled = false
        configButton.isHidden = true
        configButton.layer.cornerRadius = 10
        configButton.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
        configButton.translatesAutoresizingMaskIntoConstraints = false
        return configButton
    }()
    
    var nextButton: UIButton = {
        let configButton = UIButton()
        configButton.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
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
            
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            imageMovie.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 15),
            imageMovie.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            imageMovie.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            imageMovie.heightAnchor.constraint(equalToConstant: 200),
            imageMovie.widthAnchor.constraint(equalToConstant: 200),
            
            buttonStart.topAnchor.constraint(equalTo: imageMovie.bottomAnchor, constant: 30),
            buttonStart.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            buttonStart.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            buttonStart.heightAnchor.constraint(equalToConstant: 40),
            
            button1.topAnchor.constraint(equalTo: buttonStart.bottomAnchor, constant: 30),
            button1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            button1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            button1.heightAnchor.constraint(equalToConstant: 40),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 30),
            button2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            button2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            button2.heightAnchor.constraint(equalToConstant: 40),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 30),
            button3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            button3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            button3.heightAnchor.constraint(equalToConstant: 40),
            
            nextButton.topAnchor.constraint(equalTo: button3.bottomAnchor, constant: 30),
            nextButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            nextButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            nextButton.heightAnchor.constraint(equalToConstant: 40),

        ])
        
    }
    
    @objc func startQuizz () {
        print("start Quizz")
        
        let startQuestions = [Question.questionNumber].count - 1
        
        title.text = Question.quizz[startQuestions].question
        
        imageMovie.image = UIImage(named: "\(Question.imagesMovies[Question.questionNumber])")
        
        buttonStart.isEnabled = false
        buttonStart.isHidden = true
        
        button1.isHidden = false
        button1.isEnabled = true
        button1.setTitle(Question.quizz[startQuestions].answer1, for: .normal)
        
        button2.isHidden = false
        button2.isEnabled = true
        button2.setTitle(Question.quizz[startQuestions].answer2, for: .normal)
        
        button3.isHidden = false
        button3.isEnabled = true
        button3.setTitle(Question.quizz[startQuestions].answer3, for: .normal)
    }
    
    @objc func nextQuestion(){
        if Question.questionNumber + 1 < Question.quizz.count {
            Question.questionNumber += 1
            title.text = Question.quizz[Question.questionNumber].question
            
            imageMovie.image = UIImage(named: "\(Question.imagesMovies[Question.questionNumber])")
            //imageMovie.image = UIImage(named: "\(Question.questionNumber)")
            
            button1.setTitle(Question.quizz[Question.questionNumber].answer1, for: .normal)
            button2.setTitle(Question.quizz[Question.questionNumber].answer2, for: .normal)
            button3.setTitle(Question.quizz[Question.questionNumber].answer3, for: .normal)
            
            button1.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
            button2.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
            button3.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
            
            nextButton.isHidden = true
            nextButton.isEnabled = false
            
            
        } else {
            title.text = "Terminaste las preguntas"
            
            imageMovie.image = UIImage(named: "termino")
            
            button1.isHidden = true
            button1.isEnabled = false
            
            button2.isHidden = true
            button2.isEnabled = false
            
            button3.isHidden = true
            button3.isEnabled = false
            
            nextButton.isHidden = true
            nextButton.isEnabled = false
            
            Question.questionNumber = 0
        }
        
    }
    

    @objc func checkAnswer(_ sender: UIButton){
        let question = Int(Question.numberQuestion[Question.questionNumber])
        //let question = Int(Question.answers[Question.questionNumber]) - 1
        let userAnswer = sender.currentTitle
        
        switch question {
            // Pregunta 1
        case 1 :
            if Question.quizz[Question.questionNumber].answer2 == userAnswer {
                button1.backgroundColor = .gray
                button2.backgroundColor = .green
                button3.backgroundColor = .gray
                imageMovie.image = UIImage(named: "Si")
                
            } else {
                title.text = "Incorrecto >:("
                sender.backgroundColor = .red
                button2.backgroundColor = .green
                imageMovie.image = UIImage(named: "No")
            }
            break
            // Pregunta 2
        case 2 :
            if Question.quizz[Question.questionNumber].answer1 == userAnswer {
                button1.backgroundColor = .green
                button2.backgroundColor = .gray
                button3.backgroundColor = .gray
                imageMovie.image = UIImage(named: "Si")
                
            } else {
                sender.backgroundColor = .red
                title.text = "Incorrecto >:("
                button1.backgroundColor = .green
                imageMovie.image = UIImage(named: "No")
                
            }
            break
            
        case 3:
            if Question.quizz[Question.questionNumber].answer1 == userAnswer {
                button1.backgroundColor = .green
                button3.backgroundColor = .gray
                button2.backgroundColor = .gray
                imageMovie.image = UIImage(named: "Si")
                
            } else {
                title.text = "Incorrecto >:("
                sender.backgroundColor = .red
                button1.backgroundColor = .green
                imageMovie.image = UIImage(named: "No")
                
            }
            break
            
        case 4:
            if Question.quizz[Question.questionNumber].answer3 == userAnswer {
                button1.backgroundColor = .gray
                button3.backgroundColor = .green
                button2.backgroundColor = .gray
                imageMovie.image = UIImage(named: "Si")
                
            } else {
                title.text = "Incorrecto >:("
                sender.backgroundColor = .red
                button3.backgroundColor = .green
                imageMovie.image = UIImage(named: "No")
                
            }
            break
        case 5:
            if Question.quizz[Question.questionNumber].answer2 == userAnswer {
                button1.backgroundColor = .gray
                button2.backgroundColor = .green
                button3.backgroundColor = .gray
                imageMovie.image = UIImage(named: "Si")
                
            } else {
                title.text = "Incorrecto >:("
                sender.backgroundColor = .red
                button3.backgroundColor = .green
                imageMovie.image = UIImage(named: "No")
                
            }
            break
        default:
            title.text = "Error en la pregunta..."
            
            imageMovie.image = UIImage(named: "pensando")
            
            button1.backgroundColor = .red
            button1.isEnabled = false
            button1.isHidden = true
            
            button2.backgroundColor = .red
            button2.isEnabled = false
            button2.isHidden = true
            
            button3.backgroundColor = .red
            button3.isEnabled = false
            button3.isHidden = true
        }
        nextButton.isEnabled = true
        nextButton.isHidden = false
    
    }
    
 
    
}




