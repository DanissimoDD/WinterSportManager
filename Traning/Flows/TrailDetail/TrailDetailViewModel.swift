//
//  TrailDetailViewModel.swift
//  Traning
//
//  Created by Danil Viugov on 15.03.2025.
//

import Foundation
import SwiftUI

final class TrailDetailViewModel: ObservableObject {
	private let raceTrailId: UUID?
	@Binding var trail: Trail
	@Published var athlets: [Athlete]
	@Published var isPressed: Bool
	
	// MARK: - Init
	
	init(
		trail: Binding<Trail>,
		raceTrailId: UUID?,
		athlets: [Athlete],
		isPressed: Bool = false
	) {
		self._trail = trail
		self.raceTrailId = raceTrailId
		self.athlets = athlets
		self.isPressed = isPressed
	}
	
	var isTrailOnRace: Bool {
		trail.id == raceTrailId
	}
}
