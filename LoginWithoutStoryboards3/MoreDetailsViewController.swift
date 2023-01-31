//
//  MoreDetailsViewController.swift
//  LoginWithoutStoryboards3
//
//  Created by Дмитрий Дмитрий on 25.01.2023.
//

import UIKit

class MoreDetailsViewController: UIViewController {

    var person: User?
    
    private lazy var senecaPhoto: UIImageView = {
        var image = UIImageView()
        image = UIImageView(frame:CGRect(x: 50, y: 200, width: 300, height: 300))
        image.image = UIImage(named: person?.person?.personPhoto ?? "")
        image.backgroundColor = .orange
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = image.frame.width / 2
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        view.addSubview(senecaPhoto)
        setupNavigationBar()
//        setupConstraints()
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        changeCornerRadius()
//    }
//
//    func changeCornerRadius() {
//        senecaPhoto.layer.cornerRadius = senecaPhoto.frame.width / 2
//    }
    
    private func setupNavigationBar() {
        title = "Seneca's details"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor(
            displayP3Red: 21/255,
            green: 101/255,
            blue: 192/255,
            alpha: 194/255
        )
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
            
//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//            barButtonSystemItem: .cancel,
//            target: self,
//            action: #selector(backButton)
//        )

        let backButton = UIBarButtonItem(
            title: "Back",
            style: .plain,
            target: self,
            action: #selector(backAction)
        )
        navigationItem.leftBarButtonItem = backButton
    
        navigationController?.navigationBar.tintColor = .white
    }
    
//    @objc private func backButton() {
//        dismiss(animated: true)
//    }
    
    @objc func backAction() {
//        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    
    private func setupConstraints() {
        senecaPhoto.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            senecaPhoto.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            senecaPhoto.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            senecaPhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            senecaPhoto.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            senecaPhoto.heightAnchor.constraint(equalToConstant: 300)
            
        ])
    }
    
}
