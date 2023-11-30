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
    public var label1: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Marker Felt", size: 30)
        label.text = "Conoces a todos los personajes??"
        label.numberOfLines = 3
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
//MARK: Botones:
    public var startButton : UIButton = {
        let configButton = UIButton()
        configButton.setTitle("Claro", for: .normal)
        configButton.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
        configButton.layer.cornerRadius = 10
        configButton.addTarget(self, action: #selector(startCharacters), for: .touchUpInside)
        configButton.translatesAutoresizingMaskIntoConstraints = false
        return configButton
    }()
    
    public var answerButton1 : UIButton = {
        let configButton = UIButton()
        configButton.setTitle("Respuesta 1", for: .normal)
        configButton.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
        configButton.layer.cornerRadius = 10
        configButton.addTarget(self, action: #selector(checkCharacters), for: .touchUpInside)
        configButton.isHidden = true
        configButton.isEnabled = false
        configButton.translatesAutoresizingMaskIntoConstraints = false
        return configButton
    }()
    
    public var answerButton2 : UIButton = {
        let configButton = UIButton()
        configButton.setTitle("Respuesta 2", for: .normal)
        configButton.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
        configButton.layer.cornerRadius = 10
        configButton.addTarget(self, action: #selector(checkCharacters), for: .touchUpInside)
        configButton.isHidden = true
        configButton.isEnabled = false
        configButton.translatesAutoresizingMaskIntoConstraints = false
        return configButton
    }()
    
    public var answerButton3 : UIButton = {
        let configButton = UIButton()
        configButton.setTitle("Respuesta 3", for: .normal)
        configButton.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
        configButton.layer.cornerRadius = 10
        configButton.addTarget(self, action: #selector(checkCharacters), for: .touchUpInside)
        configButton.isHidden = true
        configButton.isEnabled = false
        configButton.translatesAutoresizingMaskIntoConstraints = false
        return configButton
    }()
    
    public var nextButton : UIButton = {
        let configButton = UIButton()
        configButton.setTitle("Siguiente Pregunta", for: .normal)
        configButton.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
        configButton.layer.cornerRadius = 10
        configButton.addTarget(self, action: #selector(nextCharacter), for: .touchUpInside)
        configButton.translatesAutoresizingMaskIntoConstraints = false
        configButton.isHidden = true
        configButton.isEnabled = false
        
        return configButton
    }()
    
    //MARK: Imagen
    public var imageCharacters: UIImageView = {
        let configImage = UIImageView()
        configImage.image = UIImage(named: "pregunta")
        configImage.contentMode = .scaleAspectFit
        configImage.translatesAutoresizingMaskIntoConstraints = false
        return configImage
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
        contentView.addSubview(label1)
        contentView.addSubview(startButton)
        contentView.addSubview(imageCharacters)
        contentView.addSubview(answerButton1)
        contentView.addSubview(answerButton2)
        contentView.addSubview(answerButton3)
        contentView.addSubview(nextButton)
        
        print("Hello world")
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
            
            imageCharacters.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 30),
            imageCharacters.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            imageCharacters.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -30),
            imageCharacters.heightAnchor.constraint(equalToConstant: 200),
            imageCharacters.widthAnchor.constraint(equalToConstant: 200),
            
            startButton.topAnchor.constraint(equalTo: imageCharacters.bottomAnchor, constant: 30),
            startButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            startButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            startButton.heightAnchor.constraint(equalToConstant: 40),
            
            answerButton1.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 30),
            answerButton1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            answerButton1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            answerButton1.heightAnchor.constraint(equalToConstant: 40),

            answerButton2.topAnchor.constraint(equalTo: answerButton1.bottomAnchor, constant: 30),
            answerButton2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            answerButton2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            answerButton2.heightAnchor.constraint(equalToConstant: 40),

            answerButton3.topAnchor.constraint(equalTo: answerButton2.bottomAnchor, constant: 30),
            answerButton3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            answerButton3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            answerButton3.heightAnchor.constraint(equalToConstant: 40),

            nextButton.topAnchor.constraint(equalTo: answerButton3.bottomAnchor, constant: 30),
            nextButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            nextButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            nextButton.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func startCharacters (){
        print("Comenzando quiz...")
        
        let start = [Characters.questionCharacter].count - 1
        label1.text = Characters.quizzCharacter[start].question
        
        startButton.isHidden = true
        startButton.isEnabled = false
        
        imageCharacters.image = UIImage(named: "\(Characters.characters[Characters.questionCharacter])")
        
        answerButton1.setTitle("\(Characters.quizzCharacter[start].answer1)", for: .normal)
        answerButton1.isHidden = false
        answerButton1.isEnabled = true
        
        answerButton2.setTitle("\(Characters.quizzCharacter[start].answer2)", for: .normal)
        answerButton2.isHidden = false
        answerButton2.isEnabled = true
        
        answerButton3.setTitle("\(Characters.quizzCharacter[start].answer3)", for: .normal)
        answerButton3.isHidden = false
        answerButton3.isEnabled = true
    }
    
    @objc func checkCharacters (_ sender: UIButton){
        
        let question = Int(Characters.numberCharacter[Characters.questionCharacter])
        let userAnswer = sender.currentTitle
        
        switch question {
        case 1:
            if Characters.quizzCharacter[Characters.questionCharacter].answer1 == userAnswer {
                answerButton1.backgroundColor = .green
                answerButton2.backgroundColor = .gray
                answerButton3.backgroundColor = .gray
                
                imageCharacters.image = UIImage(named: "Si")
            } else {
                label1.text = "Incorrecto :("
                sender.backgroundColor = .red
                imageCharacters.image = UIImage(named: "No")
                
            }
            break
            
        case 2:
            if Characters.quizzCharacter[Characters.questionCharacter].answer2 == userAnswer {
                answerButton1.backgroundColor = .gray
                answerButton2.backgroundColor = .green
                answerButton3.backgroundColor = .gray
                
                
                imageCharacters.image = UIImage(named: "Si")
            } else {
                label1.text = "Incorrecto :("
                sender.backgroundColor = .red
                imageCharacters.image = UIImage(named: "No")
                
            }
            break
            
        case 3:
            if Characters.quizzCharacter[Characters.questionCharacter].answer2 == userAnswer {
                answerButton1.backgroundColor = .gray
                answerButton2.backgroundColor = .green
                answerButton3.backgroundColor = .gray
                
                
                imageCharacters.image = UIImage(named: "Si")
            } else {
                label1.text = "Incorrecto :("
                sender.backgroundColor = .red
                imageCharacters.image = UIImage(named: "No")
                
            }
            break
        case 4:
            if Characters.quizzCharacter[Characters.questionCharacter].answer1 == userAnswer {
                answerButton1.backgroundColor = .green
                answerButton2.backgroundColor = .gray
                answerButton3.backgroundColor = .gray
                
                
                imageCharacters.image = UIImage(named: "Si")
            } else {
                label1.text = "Incorrecto :("
                sender.backgroundColor = .red
                imageCharacters.image = UIImage(named: "No")
                
            }
            break
        case 5:
            if Characters.quizzCharacter[Characters.questionCharacter].answer3 == userAnswer {
                answerButton1.backgroundColor = .gray
                answerButton2.backgroundColor = .gray
                answerButton3.backgroundColor = .green
                
                
                imageCharacters.image = UIImage(named: "Si")
            } else {
                label1.text = "Incorrecto :("
                sender.backgroundColor = .red
                imageCharacters.image = UIImage(named: "No")
                
            }
            break
        default:
            label1.text = "Error en el cuestionario :("
            
            answerButton1.backgroundColor = .red
            answerButton2.backgroundColor = .red
            answerButton3.backgroundColor = .red
            
            answerButton1.isEnabled = false
            answerButton2.isEnabled = false
            answerButton3.isEnabled = false
        }
        
        nextButton.isHidden = false
        nextButton.isEnabled = true
        
    }
    
    @objc func nextCharacter (){
        print("Siguiente pregunta > > > >")
        
        if Characters.questionCharacter + 1 < Characters.quizzCharacter.count {
            Characters.questionCharacter += 1
            
            label1.text = Characters.quizzCharacter[Characters.questionCharacter].question
            
            imageCharacters.image = UIImage(named: "\(Characters.characters[Characters.questionCharacter])")
            
            answerButton1.setTitle("\(Characters.quizzCharacter[Characters.questionCharacter].answer1)", for: .normal)
            answerButton2.setTitle("\(Characters.quizzCharacter[Characters.questionCharacter].answer2)", for: .normal)
            answerButton3.setTitle("\(Characters.quizzCharacter[Characters.questionCharacter].answer3)", for: .normal)
            
            answerButton1.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
            answerButton2.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
            answerButton3.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
            
            nextButton.isEnabled = false
            nextButton.isHidden = true
            
        } else {
            label1.text = "Termino el cuestionario"
            
            imageCharacters.image = UIImage(named: "termino")
            
            answerButton1.isEnabled = false
            answerButton1.isHidden = true
            
            answerButton2.isEnabled = false
            answerButton2.isHidden = true
            
            answerButton3.isEnabled = false
            answerButton3.isHidden = true
            
            nextButton.isEnabled = false
            nextButton.isHidden = true
            
            Characters.questionCharacter = 0
            
        }
        
    }


}




