//
//  ViewController.swift
//  Sample UserDefaults App
//
//  Created by Nuri Chun on 8/6/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let userDefaults = UserDefaults.standard
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Example: Bob"
        label.textColor = .black
        label.backgroundColor = .orange
        label.textAlignment = .center
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.backgroundColor = .orange
        textField.textAlignment = .center
        textField.attributedPlaceholder = NSAttributedString(string: "Enter your name here", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        return textField
    }()
    
    private let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTapSubmit), for: .touchUpInside)
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 30
        button.backgroundColor = .orange
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        loadUserInfo()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(submitButton)
        
        nameLabel.anchorDimensions(toView: [
            .top(anchor: view.topAnchor, padding: 100),
            .left(anchor: view.leadingAnchor, padding: 20),
            .right(anchor: view.trailingAnchor, padding: 20)
        ], size: .init(width: 0, height: 75))
        nameLabel.centerX()
        
        nameTextField.anchorDimensions(toView: [
            .top(anchor: nameLabel.bottomAnchor, padding: 20),
            .left(anchor: view.leadingAnchor, padding: 20),
            .right(anchor: view.trailingAnchor, padding: 20)
        ], size: .init(width: 0, height: 75))
        nameTextField.centerX()
        
        submitButton.anchorDimensions(toView: [
            .top(anchor: nameTextField.bottomAnchor, padding: 20),
            .left(anchor: view.leadingAnchor, padding: 20),
            .right(anchor: view.trailingAnchor, padding: 20)
        ], size: .init(width: 0, height: 75))
        submitButton.centerX()
    }
    
    func loadUserInfo() {
        if let name = userDefaults.string(forKey: "Name") {
            nameLabel.text = name
        }
    }
    
    func saveUserInfo(name: String) {
        userDefaults.setValue(name, forKey: "Name")
    }
    
    @objc func didTapSubmit() {
        print("Submit Button Tapped")
        if let value = nameTextField.text {
            nameLabel.text = value
            saveUserInfo(name: value)
        }
    }
}

