//
//  MainView.swift
//  Traning
//
//  Created by Danil Viugov on 25.01.2025.
//

import SwiftUI

struct MainView: View {
	@EnvironmentObject private var dataManager: DataStorageManager
	@State private var athletes: [Athlete] = []
	@State private var trails: [Trail] = []
	
	init() {
		printDatabasePath()
	}
	
	// TODO: - Подумать мб сразу передавать в SeasonView и делать стейтами
	var body: some View {
		SeasonView(dataManager: dataManager, athlets: $athletes, trails: $trails)
	}

	private func getApplicationSupportDirectory() -> URL? {
		let fileManager = FileManager.default
		do {
			// Получаем URL папки Application Support
			let appSupportURL = try fileManager.url(
				for: .applicationSupportDirectory,
				in: .userDomainMask,
				appropriateFor: nil,
				create: true
			)
			return appSupportURL
		} catch {
			debugPrint("Ошибка при получении пути к Application Support: \(error)")
			return nil
		}
	}

	private func printDatabasePath() {
		if let appSupportURL = getApplicationSupportDirectory() {
			debugPrint("Путь к базе данных: \(appSupportURL.path)")
		} else {
			debugPrint("Не удалось получить путь к базе данных.")
		}
	}
}
