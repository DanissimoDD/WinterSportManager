//
//  TrailDetailViewModel.swift
//  Traning
//
//  Created by Danil Viugov on 15.03.2025.
//

import Foundation
import SwiftUI

final class TrailDetailViewModel: ObservableObject {
	@Published var trail: Trail
	@Published var athlets: [Athlete]
	@Published var results: [AthletePerformance]
	@Published var isPressed: Bool
	
	// MARK: - Init
	
	init(
		trail: Trail,
		athlets: [Athlete],
		results: [AthletePerformance] = [],
		isPressed: Bool = false
	) {
		self.trail = trail
		self.athlets = athlets
		self.results = results
		self.isPressed = isPressed
	}
}
