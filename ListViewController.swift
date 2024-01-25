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
    
    var mainColor = UIColor(red: 152.0/255.0, green: 36.0/255.0, blue: 101.0/255.0, alpha: 1)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor = mainColor
        
        passwordText = UITextView()
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordText)
        
        btGenerate = UIButton()
        btGenerate.translatesAutoresizingMaskIntoConstraints = false
        btGenerate.setTitle("Gerar senhas", for: .normal)
        btGenerate.titleLabel?.font = .systemFont(ofSize: 22)
        btGenerate.setTitleColor(mainColor, for: .normal)
        btGenerate.backgroundColor = .white
        //btGenerate.addTarget(self, action: #selector(passGenerator), for: .touchUpInside)
        btGenerate.tag = 1
        btGenerate.layer.cornerRadius = 10
        view.addSubview(btGenerate)
        
        tipsButton = UIButton()
        tipsButton.translatesAutoresizingMaskIntoConstraints = false
        tipsButton.setTitle("Dicas de segurança ⓘ", for: .normal)
        tipsButton.setTitleColor(.yellow, for: .normal)
        tipsButton.tag = 1
        //tipsButton.addTarget(self, action: #selector(<#T##@objc method#>), for: .touchUpInside)
        view.addSubview(tipsButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            
            
            btGenerate.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btGenerate.widthAnchor.constraint(equalToConstant: 200),
            btGenerate.heightAnchor.constraint(equalToConstant: 80),
            
            tipsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
            tipsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }

}

// MARK: - Preview

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct UIViewControllerPreview<ListViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: ListViewController

    init(_ builder: @escaping () -> ListViewController) {
        viewController = builder()
    }
    func makeUIViewController(context: Context) -> ListViewController {
        viewController
    }

    func updateUIViewController(_ uiViewController: ListViewController, context: UIViewControllerRepresentableContext<UIViewControllerPreview<ListViewController>>) {
        return
    }
}
#endif

#if canImport(SwiftUI) && DEBUG
import SwiftUI

let deviceNames: [String] = [
    "iPhone 11 Pro Max",
]

@available(iOS 13.0, *)
struct ViewController_Preview: PreviewProvider {
  static var previews: some View {
    ForEach(deviceNames, id: \.self) { deviceName in
      UIViewControllerPreview {
          ListViewController()
      }.previewDevice(PreviewDevice(rawValue: deviceName))
        .previewDisplayName(deviceName)
    }
  }
}

#endif
