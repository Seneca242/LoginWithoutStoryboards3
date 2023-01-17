//
//  ViewController.swift
//  LoginWithoutStoryboards3
//
//  Created by Дмитрий Дмитрий on 12.01.2023.
//

import UIKit

class LoginViewController: UIViewController {

    private let userName = "Dima"
    private let password = "123"
    
    let personInfo = User.getUserInfo()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 27
//        stackView.backgroundColor = .red
        return stackView
    }()
    
    private lazy var forgotButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
//        stackView.backgroundColor = .yellow
        return stackView
    }()
    
    private lazy var userNameTF: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "User Name"
        return textField
    }()
    
    private lazy var passwordTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.configuration = .bordered()
        button.titleLabel?.font = UIFont(name: "Arial", size: 15)
        button.setTitleColor(.blue, for: .normal)
//        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        return button
    }()
    
    private lazy var forgotUserNameButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot UserName?", for: .normal)
        button.setTitleColor(.blue, for: .normal)
//        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont(name: "Arial", size: 15)
        button.addTarget(self, action: #selector(forgotName), for: .touchUpInside)
        return button
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 15)
//        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(forgotPass), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }


    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(
            title: "Ok",
            style: .default
        )
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
    
    
    private func setupView() {
        view.backgroundColor = .white
        addSubviews(subViews: stackView)
        addSubviewsToStackview(subviews: userNameTF, passwordTF, loginButton, forgotButtonsStackView)
        addSubviewsToForgotButtonStack(subviews: forgotUserNameButton, forgotPasswordButton)
        setConstraints()
    }
    
    private func addSubviews(subViews: UIView...) {
        subViews.forEach { subView in
            view.addSubview(subView)
        }
    }
    
    private func addSubviewsToForgotButtonStack(subviews: UIView...) {
        subviews.forEach { subview in
            forgotButtonsStackView.addArrangedSubview(subview)
        }
    }
    
    private func addSubviewsToStackview(subviews: UIView...) {
        subviews.forEach { subView in
            stackView.addArrangedSubview(subView)
        }
    }
    
    private func setConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 210)
        ])
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 100),
            loginButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -100)
        ])
        
    }
    
    @objc private func login() {
        if userNameTF.text != personInfo.userName || passwordTF.text != personInfo.password {
            showAlert(
                title: "Wrong UserName or Password",
                message: "Enter correct User Name and Password"
            )
        } else {
            let welcomeVC = WelcomeViewController()
            let userInfoVC = UserInfoViewController()
            
            let navigationUserInfoVC = UINavigationController(rootViewController: userInfoVC)
            welcomeVC.modalPresentationStyle = .fullScreen
            present(welcomeVC, animated: true)
            
            let tabbar = UITabBarController()
            welcomeVC.tabBarItem = .init(title: "Welcome", image: UIImage(named: "welcome"), tag: 0)
            navigationUserInfoVC.tabBarItem = .init(title: "Seneca", image: UIImage(named: "seneca"), selectedImage: nil)
            tabbar.modalPresentationStyle = .fullScreen
            tabbar.viewControllers = [welcomeVC, navigationUserInfoVC]
            
            present(tabbar, animated: true)
        }
    }
    
    @objc private func forgotName() {
        showAlert(
            title: "Oooops",
            message: "Your User Name is \(userName)"
        )
    }
    
    @objc private func forgotPass() {
        showAlert(
            title: "Oooops",
            message: "Your Password is \(password)"
        )
    }
    
}

