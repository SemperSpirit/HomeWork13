//
//  ViewController.swift
//  HomeWork13
//
//  Created by Kaiten Aiko on 10.03.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets
    
    private let arrayOfSettings: [[Model]] = [
        [
            Model(name: "Авиарежим", imageName: "1"),
            Model(name: "Wi-Fi", imageName: "2"),
            Model(name: "BlueTooth", imageName: "3"),
            Model(name: "Сотовая связь", imageName: "4"),
            Model(name: "Режим модема", imageName: "5"),
            Model(name: "VPN", imageName: "6")
        ],
        [
            Model(name: "Уведомления", imageName: "7"),
            Model(name: "Звуки, тактильные сигналы", imageName: "8"),
            Model(name: "Не беспокоить", imageName: "9"),
            Model(name: "Экранное время", imageName: "10")
        ],
        [
            Model(name: "Основные", imageName: "11"),
            Model(name: "Пункт управления", imageName: "12"),
            Model(name: "Экран и яркость", imageName: "13"),
            Model(name: "Экран 'Домой'", imageName: "14"),
            Model(name: "Универсальный доступ", imageName: "15")
        ]
    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = .systemGray6
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Настройки"
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    // MARK: - Actions

    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayOfSettings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfSettings[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.reuseIdentifier, for: indexPath) as! SettingTableViewCell
            let data = arrayOfSettings[indexPath.section][indexPath.row]
            cell.configure(with: data)
            
            if data.name == "Авиарежим" || data.name == "VPN" {
                cell.setupSwitch()
            } else {
                cell.removeSwitch()
            }
            
            return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let selectedModel = arrayOfSettings[indexPath.section][indexPath.row] as? Model else { return }
            let viewController = DetailViewController()
            viewController.model = selectedModel
            navigationController?.pushViewController(viewController, animated: true)
        
        let section = indexPath.section
        let row = indexPath.row
        let data = arrayOfSettings[section][row]
        let cellName = data.name
        print("Нажата ячейка \(cellName)")
    }
}
