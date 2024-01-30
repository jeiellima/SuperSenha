//
//  ViewController.swift
//  SuperSenha
//
//  Created by Jeiel Lima on 23/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    var lbPassAmount: UILabel!
    var tfPassAmount: UITextField!
    var lbTotalChar: UILabel!
    var tfTotalChar: UITextField!
    var lbLowerCase: UILabel!
    var swLowerCase: UISwitch!
    var lbUpperCase: UILabel!
    var swUpperCase: UISwitch!
    var lbNumbers: UILabel!
    var swNumbers: UISwitch!
    var lbSpecialChar: UILabel!
    var swSpecialChar: UISwitch!
    var btGenerate: UIButton!
    var topLabel: UILabel!
    var topView: UIView!
    var decorationImage: UIImageView!

    var mainColor = UIColor(red: 152.0/255.0, green: 36.0/255.0, blue: 101.0/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
        setupView()
        setupConstraints()
        
    }

    func setupView() {
        
        topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = mainColor
        view.addSubview(topView)
        
        topLabel = UILabel()
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.text = "Gerador de Senhas"
        topLabel.textColor = .white
        topLabel.font = .boldSystemFont(ofSize: 30)
        view.addSubview(topLabel)
    
//        customTitleView.backgroundColor = .red
//        customTitleView.translatesAutoresizingMaskIntoConstraints = false
//        navigationItem.title = "Gerador de Senhas"
        
        lbPassAmount = UILabel()
        lbPassAmount.translatesAutoresizingMaskIntoConstraints = false
        lbPassAmount.text = "Quantidade de senhas"
        lbPassAmount.textColor = mainColor
        lbPassAmount.font = .systemFont(ofSize: 23)
        view.addSubview(lbPassAmount)
        
        tfPassAmount = UITextField()
        tfPassAmount.translatesAutoresizingMaskIntoConstraints = false
        tfPassAmount.backgroundColor = .white
        tfPassAmount.textAlignment = .center
        tfPassAmount.layer.cornerRadius = 10
        tfPassAmount.layer.borderWidth = 0.8
        tfPassAmount.layer.borderColor = mainColor.cgColor
        view.addSubview(tfPassAmount)
        
        lbTotalChar = UILabel()
        lbTotalChar.translatesAutoresizingMaskIntoConstraints = false
        lbTotalChar.text = "Total de caracteres"
        lbTotalChar.textColor = mainColor
        lbTotalChar.font = .systemFont(ofSize: 23)
        view.addSubview(lbTotalChar)
        
        tfTotalChar = UITextField()
        tfTotalChar.translatesAutoresizingMaskIntoConstraints = false
        tfTotalChar.backgroundColor = .white
        tfTotalChar.placeholder = "máx. 16"
        tfTotalChar.textAlignment = .center
        tfTotalChar.layer.cornerRadius = 10
        tfTotalChar.layer.borderWidth = 0.8
        tfTotalChar.layer.borderColor = mainColor.cgColor
        view.addSubview(tfTotalChar)
        
        lbLowerCase = UILabel()
        lbLowerCase.translatesAutoresizingMaskIntoConstraints = false
        lbLowerCase.text = "Usar letras minúsculas"
        lbLowerCase.textColor = mainColor
        lbLowerCase.font = .systemFont(ofSize: 23)
        view.addSubview(lbLowerCase)
        
        swLowerCase = UISwitch()
        swLowerCase.translatesAutoresizingMaskIntoConstraints = false
        swLowerCase.onTintColor = mainColor
        view.addSubview(swLowerCase)
        
        lbUpperCase = UILabel()
        lbUpperCase.translatesAutoresizingMaskIntoConstraints = false
        lbUpperCase.text = "Usar letras maiúsculas"
        lbUpperCase.textColor = mainColor
        lbUpperCase.font = .systemFont(ofSize: 23)
        view.addSubview(lbUpperCase)
        
        swUpperCase = UISwitch()
        swUpperCase.translatesAutoresizingMaskIntoConstraints = false
        swUpperCase.onTintColor = mainColor
        view.addSubview(swUpperCase)
        
        lbNumbers = UILabel()
        lbNumbers.translatesAutoresizingMaskIntoConstraints = false
        lbNumbers.text = "Usar números"
        lbNumbers.textColor = mainColor
        lbNumbers.font = .systemFont(ofSize: 23)
        view.addSubview(lbNumbers)
        
        swNumbers = UISwitch()
        swNumbers.translatesAutoresizingMaskIntoConstraints = false
        swNumbers.onTintColor = mainColor
        view.addSubview(swNumbers)
        
        lbSpecialChar = UILabel()
        lbSpecialChar.translatesAutoresizingMaskIntoConstraints = false
        lbSpecialChar.text = "Usar caracteres especiais"
        lbSpecialChar.textColor = mainColor
        lbSpecialChar.font = .systemFont(ofSize: 23)
        view.addSubview(lbSpecialChar)
        
        swSpecialChar = UISwitch()
        swSpecialChar.translatesAutoresizingMaskIntoConstraints = false
        swSpecialChar.onTintColor = mainColor
        view.addSubview(swSpecialChar)
        
        btGenerate = UIButton()
        btGenerate.translatesAutoresizingMaskIntoConstraints = false
        btGenerate.setTitle("Gerar senhas", for: .normal)
        btGenerate.titleLabel?.font = .systemFont(ofSize: 22)
        btGenerate.setTitleColor(.white, for: .normal)
        btGenerate.backgroundColor = mainColor
        btGenerate.addTarget(self, action: #selector(passGenerator), for: .touchUpInside)
        btGenerate.tag = 1
        btGenerate.layer.cornerRadius = 10
        view.addSubview(btGenerate)
        
        decorationImage = UIImageView()
        decorationImage.translatesAutoresizingMaskIntoConstraints = false
        decorationImage.image = UIImage(named: "lock")
        decorationImage.alpha = 0.2
        decorationImage.contentMode = .scaleAspectFill
        view.addSubview(decorationImage)
        
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            topView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topView.heightAnchor.constraint(equalToConstant: 130),
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            topLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            topLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 20),
            
//            customTitleView.widthAnchor.constraint(equalToConstant: 200),
//            customTitleView.heightAnchor.constraint(equalToConstant: 40),
//            customTitleView.topAnchor.constraint(equalTo: view.topAnchor),
            
            lbPassAmount.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 35),
            lbPassAmount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            lbPassAmount.trailingAnchor.constraint(equalTo: tfPassAmount.leadingAnchor),
            
            tfPassAmount.centerYAnchor.constraint(equalTo: lbPassAmount.centerYAnchor),
            tfPassAmount.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            tfPassAmount.widthAnchor.constraint(equalToConstant: 100),
            tfPassAmount.heightAnchor.constraint(equalToConstant: 45),
            
            lbTotalChar.topAnchor.constraint(equalTo: lbPassAmount.bottomAnchor, constant: 30),
            lbTotalChar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            lbTotalChar.trailingAnchor.constraint(equalTo: tfTotalChar.leadingAnchor),
            
            tfTotalChar.leadingAnchor.constraint(equalTo: lbTotalChar.trailingAnchor),
            tfTotalChar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            tfTotalChar.centerYAnchor.constraint(equalTo: lbTotalChar.centerYAnchor),
            tfTotalChar.widthAnchor.constraint(equalToConstant: 100),
            tfTotalChar.heightAnchor.constraint(equalToConstant: 45),
            
            lbLowerCase.topAnchor.constraint(equalTo: lbTotalChar.bottomAnchor, constant: 30),
            lbLowerCase.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            lbLowerCase.trailingAnchor.constraint(equalTo: swLowerCase.leadingAnchor),
            
            swLowerCase.centerYAnchor.constraint(equalTo: lbLowerCase.centerYAnchor),
            swLowerCase.centerXAnchor.constraint(equalTo: tfTotalChar.centerXAnchor, constant: 12),
            swLowerCase.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            lbUpperCase.topAnchor.constraint(equalTo: lbLowerCase.bottomAnchor, constant: 30),
            lbUpperCase.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            lbUpperCase.trailingAnchor.constraint(equalTo: swUpperCase.leadingAnchor),
            
            swUpperCase.centerYAnchor.constraint(equalTo: lbUpperCase.centerYAnchor),
            swUpperCase.centerXAnchor.constraint(equalTo: tfTotalChar.centerXAnchor, constant: 12),
            swUpperCase.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            lbNumbers.topAnchor.constraint(equalTo: lbUpperCase.bottomAnchor, constant: 30),
            lbNumbers.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            lbNumbers.trailingAnchor.constraint(equalTo: swNumbers.leadingAnchor),
            
            swNumbers.centerYAnchor.constraint(equalTo: lbNumbers.centerYAnchor),
            swNumbers.centerXAnchor.constraint(equalTo: tfTotalChar.centerXAnchor, constant: 12),
            swNumbers.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            lbSpecialChar.topAnchor.constraint(equalTo: lbNumbers.bottomAnchor, constant: 30),
            lbSpecialChar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            lbSpecialChar.trailingAnchor.constraint(equalTo: swSpecialChar.leadingAnchor),
            
            swSpecialChar.centerYAnchor.constraint(equalTo: lbSpecialChar.centerYAnchor),
            swSpecialChar.centerXAnchor.constraint(equalTo: tfTotalChar.centerXAnchor, constant: 12),
            swSpecialChar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            btGenerate.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btGenerate.topAnchor.constraint(equalTo: lbSpecialChar.bottomAnchor, constant: 50),
            btGenerate.widthAnchor.constraint(equalToConstant: 280),
            btGenerate.heightAnchor.constraint(equalToConstant: 70),
            
            decorationImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            decorationImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20),
            decorationImage.widthAnchor.constraint(equalToConstant: 250),
            decorationImage.heightAnchor.constraint(equalToConstant: 250),
        ])
    }
    
    @objc func passGenerator(sender: UIButton!) {
        let btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            
            let listViewController = ListViewController()
            navigationController?.pushViewController(listViewController, animated: true)
            
            if let numberOfPasswords = Int(tfPassAmount.text!) {
                listViewController.numberOfPass = numberOfPasswords
            }
            
            if let numberOfCharacters = Int(tfTotalChar.text!) {
                listViewController.numberOfChar = numberOfCharacters
            }
            
            listViewController.useLower = swLowerCase.isOn
            listViewController.useUpper = swUpperCase.isOn
            listViewController.useNumbers = swNumbers.isOn
            listViewController.useSpecialChar = swSpecialChar.isOn
            view.endEditing(true)
            
        }
    }
}
