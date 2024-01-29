//
//  ListViewController.swift
//  SuperSenha
//
//  Created by Jeiel Lima on 25/01/24.
//

import UIKit

class ListViewController: UIViewController {
    var tipsButton: UIButton!
    var btGenerate: UIButton!
    var passwordText: UITextView!
    
    var numberOfChar: Int = 10
    var numberOfPass: Int = 1
    var useLower: Bool!
    var useUpper: Bool!
    var useNumbers: Bool!
    var useSpecialChar: Bool!
    
    var passwordGenerator: PasswordGenerator!
    
    var mainColor = UIColor(red: 152.0/255.0, green: 36.0/255.0, blue: 101.0/255.0, alpha: 1)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setupView()
        setupConstraints()
        generatePasswords()
    }
    
    func setupView() {
        view.backgroundColor = mainColor
        title = "Total de senhas: \(numberOfPass)"

        passwordGenerator = PasswordGenerator(numberOfChar: numberOfChar, useLower: useLower, useUpper: useUpper, useNumber: useNumbers, useSpecialChar: useSpecialChar)
        
        passwordText = UITextView()
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        passwordText.backgroundColor = .white
        passwordText.isEditable = false
        passwordText.isSelectable = true
        passwordText.font = .systemFont(ofSize: 17)
        view.addSubview(passwordText)
        
        btGenerate = UIButton()
        btGenerate.translatesAutoresizingMaskIntoConstraints = false
        btGenerate.setTitle("Gerar novamente", for: .normal)
        btGenerate.titleLabel?.font = .systemFont(ofSize: 22)
        btGenerate.setTitleColor(mainColor, for: .normal)
        btGenerate.backgroundColor = .white
        btGenerate.addTarget(self, action: #selector(generate), for: .touchUpInside)
        btGenerate.tag = 1
        btGenerate.layer.cornerRadius = 10
        view.addSubview(btGenerate)
        
        tipsButton = UIButton()
        tipsButton.translatesAutoresizingMaskIntoConstraints = false
        tipsButton.setTitle("Dicas sobre segurança ⓘ", for: .normal)
        tipsButton.titleLabel?.font = .systemFont(ofSize: 18)
        tipsButton.setTitleColor(.yellow, for: .normal)
        tipsButton.tag = 1
        tipsButton.addTarget(self, action: #selector(tipsView), for: .touchUpInside) // Present Modally
        view.addSubview(tipsButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            passwordText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordText.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            passwordText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordText.widthAnchor.constraint(equalToConstant: 350),
            passwordText.heightAnchor.constraint(equalToConstant: 465),
            
            btGenerate.centerXAnchor.constraint(equalTo: passwordText.centerXAnchor),
            btGenerate.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 35),
            btGenerate.widthAnchor.constraint(equalToConstant: 280),
            btGenerate.heightAnchor.constraint(equalToConstant: 70),
            
            tipsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25),
            tipsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
        ])
    }
    
    func generatePasswords() {
        let passwords = passwordGenerator.generate(total: numberOfPass)
        for password in passwords {
            passwordText.text.append(password + "\n\n")
        }
    }
    
    @objc func generate(sender: UIButton!) {
        let btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            passwordText.scrollsToTop = true
            passwordText.text = ""
            generatePasswords()
        }
    }
    
    @objc func tipsView(sender: UIButton!) {
        let btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            let tipsViewController = TipsViewController()
            navigationController?.present(tipsViewController, animated: true, completion: nil)
        }
    }
}
