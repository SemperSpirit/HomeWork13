//
//  Model.swift
//  HomeWork13
//
//  Created by Kaiten Aiko on 10.03.2024.
//

import UIKit

class Model {
    
    var name: String
    var systemName: String

    init(name: String, systemName: String) {
        self.name = name
        self.systemName = systemName
    }
    
    static func addModels() -> [[Model]] {
        let arrayOfSettings: [[Model]] = [
            [
                Model(name: "Авиарежим", systemName: "1"),
                Model(name: "Wi-Fi", systemName: "2"),
                Model(name: "BlueTooth", systemName: "3"),
                Model(name: "Сотовая связь", systemName: "4"),
                Model(name: "Режим модема", systemName: "5"),
                Model(name: "VPN", systemName: "6")
            ],
            [
                Model(name: "Уведомления", systemName: "7"),
                Model(name: "Звуки, тактильные сигналы", systemName: "8"),
                Model(name: "Не беспокоить", systemName: "9"),
                Model(name: "Экранное время", systemName: "10")
            ],
            [
                Model(name: "Основные", systemName: "11"),
                Model(name: "Пункт управления", systemName: "12"),
                Model(name: "Экран и яркость", systemName: "13"),
                Model(name: "Экран 'Домой'", systemName: "14"),
                Model(name: "Универсальный доступ", systemName: "15")
            ]
        ]
        return arrayOfSettings
    }
}
