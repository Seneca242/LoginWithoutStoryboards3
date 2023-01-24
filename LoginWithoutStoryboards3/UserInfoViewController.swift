//
//  UserInfoViewController.swift
//  LoginWithoutStoryboards3
//
//  Created by Дмитрий Дмитрий on 17.01.2023.
//

import UIKit

class UserInfoViewController: UIViewController {

    var person: User?
    
    private lazy var personStoryLabel: UILabel = {
        let label = UILabel()
        label.text = person?.person?.personStory
        label.backgroundColor = .black
        label.font = UIFont(name: "Arial", size: 14)
        label.textColor = .white
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(person?.person?.name ?? "") \(person?.person?.lastName ?? "")"
        view.backgroundColor = .red
        view.addSubview(personStoryLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        personStoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            personStoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            personStoryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            personStoryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            personStoryLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 200)
        ])
    }
    

    

}
