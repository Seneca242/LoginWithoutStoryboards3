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
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        changeCornerRadius()
//    }
//
//    func changeCornerRadius() {
//        senecaPhoto.layer.cornerRadius = senecaPhoto.frame.width / 2
//    }
    
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
