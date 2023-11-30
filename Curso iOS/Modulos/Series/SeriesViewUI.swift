//
//  SeriesViewUI.swift
//  Curso iOS
//
//  Created Fatima Ramirez on 23/11/23.
//  2023 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit

protocol SeriesViewUIDelegate {
    
}

class SeriesViewUI: UIView{
    //MARK: ELEMENTOS
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
        label.text = "Eres un experto en Series?"
        label.numberOfLines = 3
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
//MARK: Botones:
    public var startButton : UIButton = {
        let configButton = UIButton()
        configButton.setTitle("Averiguemoslo :)", for: .normal)
        configButton.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
        configButton.layer.cornerRadius = 10
        configButton.addTarget(self, action: #selector(startSeries), for: .touchUpInside)
        configButton.translatesAutoresizingMaskIntoConstraints = false
        return configButton
    }()
    
    public var answerButton1 : UIButton = {
        let configButton = UIButton()
        configButton.setTitle("Respuesta 1", for: .normal)
        configButton.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
        configButton.layer.cornerRadius = 10
        configButton.addTarget(self, action: #selector(checkSeries), for: .touchUpInside)
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
        configButton.addTarget(self, action: #selector(checkSeries), for: .touchUpInside)
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
        configButton.addTarget(self, action: #selector(checkSeries), for: .touchUpInside)
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
        configButton.addTarget(self, action: #selector(nextSeries), for: .touchUpInside)
        configButton.translatesAutoresizingMaskIntoConstraints = false
        configButton.isHidden = true
        configButton.isEnabled = false
        
        return configButton
    }()
    
    //MARK: Imagen
    public var imageSeries: UIImageView = {
        let configImage = UIImageView()
        configImage.image = UIImage(named: "pregunta")
        configImage.contentMode = .scaleAspectFit
        configImage.translatesAutoresizingMaskIntoConstraints = false
        return configImage
    }()
    
    
    var delegate: SeriesViewUIDelegate?
    var navigationController: UINavigationController?
    
    public convenience init(
        navigation: UINavigationController,
        delegate: SeriesViewUIDelegate){
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
    
    func setupElements() {
        addSubview(navigationBar)
        addSubview(contentView)
        contentView.addSubview(label1)
        contentView.addSubview(startButton)
        contentView.addSubview(imageSeries)
        contentView.addSubview(answerButton1)
        contentView.addSubview(answerButton2)
        contentView.addSubview(answerButton3)
        contentView.addSubview(nextButton)
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
            
            imageSeries.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 30),
            imageSeries.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            imageSeries.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -30),
            imageSeries.heightAnchor.constraint(equalToConstant: 200),
            imageSeries.widthAnchor.constraint(equalToConstant: 200),
            
            startButton.topAnchor.constraint(equalTo: imageSeries.bottomAnchor, constant: 30),
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
    
    //MARK: FUNCIONES
    @objc func startSeries (){
        print("Comenzando quiz...")
        
        let start = [Series.questionSeries].count - 1
        label1.text = Series.quizzSeries[start].question
        
        startButton.isHidden = true
        startButton.isEnabled = false
        
        imageSeries.image = UIImage(named: "\(Series.series[Series.questionSeries])")
        
        answerButton1.setTitle("\(Series.quizzSeries[start].answer1)", for: .normal)
        answerButton1.isHidden = false
        answerButton1.isEnabled = true
        
        answerButton2.setTitle("\(Series.quizzSeries[start].answer2)", for: .normal)
        answerButton2.isHidden = false
        answerButton2.isEnabled = true
        
        answerButton3.setTitle("\(Series.quizzSeries[start].answer3)", for: .normal)
        answerButton3.isHidden = false
        answerButton3.isEnabled = true
    }
    
    @objc func checkSeries (_ sender: UIButton){
        
        let question = Int(Series.numberSeries[Series.questionSeries])
        let userAnswer = sender.currentTitle
        
        switch question {
        case 1:
            if Series.quizzSeries[Series.questionSeries].answer1 == userAnswer {
                answerButton1.backgroundColor = .green
                answerButton2.backgroundColor = .gray
                answerButton3.backgroundColor = .gray
                
                imageSeries.image = UIImage(named: "Si")
            } else {
                label1.text = "Incorrecto :("
                sender.backgroundColor = .red
                imageSeries.image = UIImage(named: "No")
                
            }
            break
            
        case 2:
            if Series.quizzSeries[Series.questionSeries].answer2 == userAnswer {
                answerButton1.backgroundColor = .gray
                answerButton2.backgroundColor = .green
                answerButton3.backgroundColor = .gray
                
                
                imageSeries.image = UIImage(named: "Si")
            } else {
                label1.text = "Incorrecto :("
                sender.backgroundColor = .red
                imageSeries.image = UIImage(named: "No")
                
            }
            break
            
        case 3:
            if Series.quizzSeries[Series.questionSeries].answer2 == userAnswer {
                answerButton1.backgroundColor = .gray
                answerButton2.backgroundColor = .green
                answerButton3.backgroundColor = .gray
                
                
                imageSeries.image = UIImage(named: "Si")
            } else {
                label1.text = "Incorrecto :("
                sender.backgroundColor = .red
                imageSeries.image = UIImage(named: "No")
                
            }
            break
        case 4:
            if Series.quizzSeries[Series.questionSeries].answer3 == userAnswer {
                answerButton1.backgroundColor = .gray
                answerButton2.backgroundColor = .gray
                answerButton3.backgroundColor = .green
                
                
                imageSeries.image = UIImage(named: "Si")
            } else {
                label1.text = "Incorrecto :("
                sender.backgroundColor = .red
                imageSeries.image = UIImage(named: "No")
                
            }
            break
        case 5:
            if Series.quizzSeries[Series.questionSeries].answer3 == userAnswer {
                answerButton1.backgroundColor = .gray
                answerButton2.backgroundColor = .gray
                answerButton3.backgroundColor = .green
                
                
                imageSeries.image = UIImage(named: "Si")
            } else {
                label1.text = "Incorrecto :("
                sender.backgroundColor = .red
                imageSeries.image = UIImage(named: "No")
                
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
    
    @objc func nextSeries (){
        print("Siguiente pregunta > > > >")
        
        if Series.questionSeries + 1 < Series.quizzSeries.count {
            Series.questionSeries += 1
            
            label1.text = Series.quizzSeries[Series.questionSeries].question
            
            imageSeries.image = UIImage(named: "\(Series.series[Series.questionSeries])")
            
            answerButton1.setTitle("\(Series.quizzSeries[Series.questionSeries].answer1)", for: .normal)
            answerButton2.setTitle("\(Series.quizzSeries[Series.questionSeries].answer2)", for: .normal)
            answerButton3.setTitle("\(Series.quizzSeries[Series.questionSeries].answer3)", for: .normal)
            
            answerButton1.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
            answerButton2.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
            answerButton3.backgroundColor = UIColor(cgColor: CGColor(red: 234/255, green: 137/255, blue: 154/255, alpha: 1))
            
            nextButton.isEnabled = false
            nextButton.isHidden = true
            
        } else {
            label1.text = "Termino el cuestionario"
            
            imageSeries.image = UIImage(named: "termino")
            
            answerButton1.isEnabled = false
            answerButton1.isHidden = true
            
            answerButton2.isEnabled = false
            answerButton2.isHidden = true
            
            answerButton3.isEnabled = false
            answerButton3.isHidden = true
            
            nextButton.isEnabled = false
            nextButton.isHidden = true
            
            Series.questionSeries = 0
            
        }
        
    }

}




