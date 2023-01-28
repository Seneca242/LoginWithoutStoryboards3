//
//  UserInfoViewController.swift
//  LoginWithoutStoryboards3
//
//  Created by Дмитрий Дмитрий on 17.01.2023.
//

import UIKit

class UserInfoViewController: UIViewController {

    var person: User?
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.frame.size = contentSize
        return contentView
    }()
    
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
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 400)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(person?.person?.name ?? "") \(person?.person?.lastName ?? "")"
        view.backgroundColor = .red
        addSubviews(subViews: scrollView)
        scrollView.addSubview(contentView)
        addSubviewsToContentView(subViews: moreDetailsButton, personStoryLabel)
        setupConstraints()
    }
    
    private func addSubviews(subViews: UIView...) {
        subViews.forEach { subView in
            view.addSubview(subView)
        }
    }
    
    private func addSubviewsToContentView(subViews: UIView...) {
        subViews.forEach { subView in
            contentView.addSubview(subView)
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
            personStoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            personStoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            personStoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
        ])
        
        moreDetailsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moreDetailsButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            moreDetailsButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            moreDetailsButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
