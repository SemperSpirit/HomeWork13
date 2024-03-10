//
//  DetailViewController.swift
//  HomeWork13
//
//  Created by Kaiten Aiko on 10.03.2024.
//

import UIKit

final class DetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    var model: Model?
    
    private let settingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fillSettings()
    }
    
    // MARK: - Setup

    private func setupUI() {
        view.addSubview(settingImageView)
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            settingImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            settingImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            settingImageView.widthAnchor.constraint(equalToConstant: 100),
            settingImageView.heightAnchor.constraint(equalToConstant: 100),
            
            nameLabel.topAnchor.constraint(equalTo: settingImageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func fillSettings() {
        guard let model = model else { return }
        settingImageView.image = UIImage(named: model.imageName)
        nameLabel.text = model.name
    }
}
