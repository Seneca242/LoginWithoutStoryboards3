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
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var moreDetailsButton: UIButton = {
        let button = UIButton()
        button.setTitle("More details", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont(name: "Arial", size: 17)
        button.addTarget(self, action: #selector(moreDetails), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(person?.person?.name ?? "") \(person?.person?.lastName ?? "")"
        view.backgroundColor = .red
        addSubviews(subViews: personStoryLabel, moreDetailsButton)
        setupConstraints()
    }
    
    private func addSubviews(subViews: UIView...) {
        subViews.forEach { subView in
            view.addSubview(subView)
        }
    }
    
    @objc private func moreDetails() {
        let moreDetailsVC = MoreDetailsViewController()
        moreDetailsVC.person = person
        moreDetailsVC.modalPresentationStyle = .fullScreen
        present(moreDetailsVC, animated: true)
    }
    
    private func setupConstraints() {
        personStoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            personStoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            personStoryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            personStoryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
        ])
        
        moreDetailsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moreDetailsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
//            moreDetailsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            moreDetailsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            moreDetailsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moreDetailsButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    

    

}
