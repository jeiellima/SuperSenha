//
//  TipsViewController.swift
//  SuperSenha
//
//  Created by Jeiel Lima on 25/01/24.
//

import UIKit

class TipsViewController: UIViewController {

    var topLabel: UILabel!
    var tipsTextView: UITextView!
    var dismissButton: UIButton!
    var mainColor = UIColor(red: 152.0/255.0, green: 36.0/255.0, blue: 101.0/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        
        topLabel = UILabel()
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.text = "10 dicas para ter uma senha forte"
        topLabel.font = .systemFont(ofSize: 23)
        topLabel.textColor = mainColor
        view.addSubview(topLabel)
        
        tipsTextView = UITextView()
        tipsTextView.translatesAutoresizingMaskIntoConstraints = false
        tipsTextView.text = """
        1. Escolha senhas fáceis de lembrar
        Uma senha fácil de guardar na memória evita que o usuário tenha que anotá-la em papeis ou arquivos, que podem chegar às mãos de pessoas erradas.

        2. Não use palavras reais
        Uma palavra que pode ser encontrada no dicionário pode facilitar o trabalho de hackers. Para tornar esse trabalho mais difícil, use frases ao invés de substantivos.

        3.  Combine maiúsculas, minúsculas, números e caracteres não alfanuméricos
        A inserção desses itens na senha complica ainda mais o trabalho de quem estiver mal intencionado.

        4.  Não recicle senhas
        Por exemplo, não use "senha1 ‘, ' senha2 ‘, ' senha3 ' em contas diferentes. Ao mudar apenas um caractere, o usuário corre o risco de entregar o acesso a outros serviços ao cibercriminoso

        5. Não use a mesma senha para várias contas
        O mesmo se aplica nesse caso. Caso o pior aconteça, o usuário perde a segurança de todas as suas contas.

        6.   Não use senhas óbvias que podem ser facilmente descobertas
        Não escolha como código o nome de pessoas da família, como filho, marido ou até do animal de estimação. Ao investigar levemente a vida de alguém, esses nomes são facilmente descobertos e podem se tornar uma arma.

        7.  Não compartilhe sua senha
        Nunca compartilhe suas informações pessoais. Se alguma empresa pedir sua senha, mesmo que por telefone, não informe. Lembre-se, você não sabe quem está do outro lado da linha telefônica.

        8.  Se algum site enviar um e-mail de confirmação com uma nova senha, inicie uma nova sessão na página e altere sua senha imediatamente
        Esse procedimento evita possíveis fraudes. Ao abrir links suspeitos, o usuário pode acabar fornecendo informações pessoais sem perceber.

        9.     Certifique-se de que seu software de segurança da Internet bloqueie as intenções dos cibercriminosos de interceptar ou roubar senhas
        Muitos ataques podem ser evitados ao ativar serviços básicos de proteção na internet dos antivírus.

        10.  Se você achar que é difícil lembrar-se de várias senhas complexas, considere a instalação de um gerenciadores de senhas
        Há diversos programas disponíveis que armazenam os dados de maneira segura e ajudam os mais esquecidos.
        """
        tipsTextView.textColor = .black
        tipsTextView.font = .systemFont(ofSize: 18)
        view.addSubview(tipsTextView)
        
        dismissButton = UIButton()
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.setTitle("fechar", for: .normal)
        dismissButton.setTitleColor(mainColor, for: .normal)
        dismissButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        view.addSubview(dismissButton)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            
            tipsTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tipsTextView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 20),
            tipsTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            tipsTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            tipsTextView.bottomAnchor.constraint(equalTo: dismissButton.topAnchor, constant: -20),
            
            dismissButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            dismissButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
 
        ])
    }
    
    @objc func close(sender: UIButton!) {
        let btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            dismiss(animated: true, completion: nil)
        }
    }
}

// MARK: - Preview

//#if canImport(SwiftUI) && DEBUG
//import SwiftUI
//struct UIViewControllerPreview<TipsViewController: UIViewController>: UIViewControllerRepresentable {
//    let viewController: TipsViewController
//
//    init(_ builder: @escaping () -> TipsViewController) {
//        viewController = builder()
//    }
//    func makeUIViewController(context: Context) -> TipsViewController {
//        viewController
//    }
//
//    func updateUIViewController(_ uiViewController: TipsViewController, context: UIViewControllerRepresentableContext<UIViewControllerPreview<TipsViewController>>) {
//        return
//    }
//}
//#endif
//
//#if canImport(SwiftUI) && DEBUG
//import SwiftUI
//
//let deviceNames: [String] = [
//    "iPhone 11 Pro Max",
//]
//
//@available(iOS 13.0, *)
//struct ViewController_Preview: PreviewProvider {
//  static var previews: some View {
//    ForEach(deviceNames, id: \.self) { deviceName in
//      UIViewControllerPreview {
//          TipsViewController()
//      }.previewDevice(PreviewDevice(rawValue: deviceName))
//        .previewDisplayName(deviceName)
//    }
//  }
//}
//
//#endif
