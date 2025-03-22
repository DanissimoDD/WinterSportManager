//
//  UserDefaultsManager.swift
//  Traning
//
//  Created by Danil Viugov on 01.02.2025.
//

import Foundation

final class UserDefaultsManager {
	private let userDefaults = UserDefaults.standard
	
	// Ключ для хранения флага создания атлетов
	private let athletesCreatedKey = "athletesCreated"
	
	// Проверка, были ли атлеты созданы
	var areInitialDataCreated: Bool {
		get {
			return userDefaults.bool(forKey: athletesCreatedKey)
		}
		set {
			userDefaults.set(newValue, forKey: athletesCreatedKey)
		}
	}
}
