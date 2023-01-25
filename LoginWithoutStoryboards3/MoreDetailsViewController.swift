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
        let image = UIImageView()
        image.image = UIImage(named: "Seneca")
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        view.addSubview(senecaPhoto)
    }
    
    private func setupConstraints() {
        senecaPhoto.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            senecaPhoto.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            senecaPhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            senecaPhoto.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            
        ])
    }
    
}
