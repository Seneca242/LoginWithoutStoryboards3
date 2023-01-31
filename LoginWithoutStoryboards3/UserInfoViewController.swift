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
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        //
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(person?.person?.name ?? "") \(person?.person?.lastName ?? "")"
        view.backgroundColor = .red
        addSubviews(subViews: scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        addSubviewsToStackView(subViews: moreDetailsButton, personStoryLabel)
        setupConstraints()
    }
    
    private func addSubviews(subViews: UIView...) {
        subViews.forEach { subView in
            view.addSubview(subView)
        }
    }
    
    private func addSubviewsToStackView(subViews: UIView...) {
        subViews.forEach { subView in
            // addArrangedSubview vs addSubview
            stackView.addArrangedSubview(subView)
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
            personStoryLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            personStoryLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -20),
            personStoryLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 100),
        ])
        
        moreDetailsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moreDetailsButton.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 40),
            //            moreDetailsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            //            moreDetailsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            moreDetailsButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            moreDetailsButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
