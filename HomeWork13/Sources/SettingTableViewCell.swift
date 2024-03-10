//
//  SettingTableViewCell.swift
//  HomeWork13
//
//  Created by Kaiten Aiko on 10.03.2024.
//

import UIKit

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    // MARK: - Outlets

    static let reuseIdentifier = "SettingTableViewCell"
    
    var model: Model?

    let settingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        return switchControl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        addSubview(settingImageView)
        addSubview(nameLabel)
        addSubview(switchControl)

        NSLayoutConstraint.activate([
            settingImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            settingImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            settingImageView.widthAnchor.constraint(equalToConstant: 30),
            settingImageView.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: settingImageView.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: switchControl.leadingAnchor, constant: -16),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            switchControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            switchControl.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        switchControl.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)

    }
    
    func setupSwitch() {
        switchControl.onTintColor = UIColor.green
        switchControl.isHidden = false
        switchControl.isOn = false
        self.switchControl.setOn(true, animated: true)
    }
    
    func removeSwitch() {
        switchControl.isHidden = true
    }
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        guard let model = model else { return }
        print("\(model.name) switch value changed: \(sender.isOn)")
    }

    func configure(with model: Model) {
        self.model = model
        settingImageView.image = UIImage(named: model.imageName)
        nameLabel.text = model.name
    }
}


