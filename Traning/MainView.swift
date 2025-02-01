//
//  MainView.swift
//  Traning
//
//  Created by Danil Viugov on 25.01.2025.
//

import SwiftUI

struct MainView: View {
	@EnvironmentObject private var dataManager: DataManager
	@State private var athletes: [Athlete] = []
	
	var body: some View {
		SeasonView(trails: TrailCases.allCases.map { $0.details }, athlets: $athletes)
			.onAppear {
				loadAthletes()
			}
	}
	
	private func loadAthletes() {
		do {
			athletes = try dataManager.fetchAthletes()
		} catch {
			print("Failed to fetch athletes: \(error)")
		}
	}
}
