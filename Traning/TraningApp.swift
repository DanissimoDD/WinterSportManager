//
//  TraningApp.swift
//  Traning
//
//  Created by Danil Viugov on 22.01.2025.
//

import SwiftUI

@main
struct TraningApp: App {
	// Создаем менеджеры
 private let userDefaultsManager = UserDefaultsManager()
 private let dataManager: DataManager

 init() {
	 // Инициализируем DataManager
	 self.dataManager = DataManager(defaults: userDefaultsManager)
	 // Создаем атлетов, если нужно
	 self.dataManager.createInitialAthletesIfNeeded()
 }
	
    var body: some Scene {
        WindowGroup {
			MainView()
				.environmentObject(dataManager)
        }
    }
}



//    let persistenceController = PersistenceController.shared

//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
