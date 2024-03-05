//
//  ViewController.swift
//  HomeWork5
//
//  Created by Alex Matsenko on 05.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let mailLabel = UILabel()
    let mailTextFild = UITextField()
    let passwordLabel = UILabel()
    let passwordTextFiled = UITextField()
    let logInButton = UIButton()
    let registerButton = UIButton()
    var isHidenPassword = false
    let securedPasswordButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        view.backgroundColor = .white
        //Config mail label
        mailLabel.text = "Mail:"
        mailLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
        //Config mail TextView
        mailTextFild.placeholder = " Enter your e-mail:"
        mailTextFild.layer.borderColor = UIColor.systemBlue.cgColor
        mailTextFild.layer.borderWidth = 1
        mailTextFild.layer.cornerRadius = 5
        
        //Config password lable
        passwordLabel.text = "Password:"
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
        //Config password TextView
        passwordTextFiled.placeholder = " Enter your password:"
        passwordTextFiled.layer.borderColor = UIColor.systemBlue.cgColor
        passwordTextFiled.layer.borderWidth = 1
        passwordTextFiled.layer.cornerRadius = 5
        passwordTextFiled.isSecureTextEntry = true
        
        //Config buttons "Login&Regisrter"
        logInButton.setTitle("Login", for: .normal)
        logInButton.backgroundColor = .blue
        logInButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        logInButton.layer.cornerRadius = 10
        
        registerButton.setTitle("Register", for: .normal)
        registerButton.backgroundColor = .blue
        registerButton.layer.cornerRadius = 10
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        // Add all views to main View & off mask
        [mailLabel,mailTextFild,passwordLabel,passwordTextFiled,logInButton,registerButton].forEach({$0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        })
        
        //Config constraints
        NSLayoutConstraint.activate([
            //MailLabel
            mailLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            mailLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            mailLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            //MaleTextField
            mailTextFild.topAnchor.constraint(equalTo: mailLabel.bottomAnchor, constant: 5),
            mailTextFild.leadingAnchor.constraint(equalTo: mailLabel.leadingAnchor),
            mailTextFild.trailingAnchor.constraint(equalTo: mailLabel.trailingAnchor),
            mailTextFild.heightAnchor.constraint(equalToConstant: 44),
            
            //Passwordlabel
            passwordLabel.topAnchor.constraint(equalTo: mailTextFild.bottomAnchor, constant: 5),
            passwordLabel.leadingAnchor.constraint(equalTo: mailTextFild.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: mailTextFild.trailingAnchor),
            
            //PasswodTextField
            passwordTextFiled.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTextFiled.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordTextFiled.trailingAnchor.constraint(equalTo: passwordLabel.trailingAnchor),
            passwordTextFiled.heightAnchor.constraint(equalTo: mailTextFild.heightAnchor),
            
            //LoginButton
            logInButton.topAnchor.constraint(equalTo: passwordTextFiled.bottomAnchor, constant: 40),
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: 44),
            logInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            //RegisterButton
            registerButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 15),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.heightAnchor.constraint(equalTo: logInButton.heightAnchor),
            registerButton.widthAnchor.constraint(equalTo: logInButton.widthAnchor)
            
        ])
        //Config secureButton
        securedPasswordButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        passwordTextFiled.rightView = securedPasswordButton
        passwordTextFiled.rightViewMode = .always
        securedPasswordButton.addTarget(self, action: #selector(hidePassword), for: .touchUpInside)
    }
    
    @objc private  func hidePassword(){
        isHidenPassword.toggle()
        passwordTextFiled.isSecureTextEntry = isHidenPassword
        let image = isHidenPassword ? UIImage(systemName: "eye.slash.fill") : UIImage(systemName: "eye.fill")
        securedPasswordButton.setImage(image, for: .normal)
    }
}


