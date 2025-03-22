//
//  TrailDetailViewModel.swift
//  Traning
//
//  Created by Danil Viugov on 15.03.2025.
//

import Foundation
import SwiftUI

final class TrailDetailViewModel: ObservableObject {
	@Binding var trail: Trail
	@Published var athlets: [Athlete]
	@Published var isPressed: Bool
	
	// MARK: - Init
	
	init(
		trail: Binding<Trail>,
		athlets: [Athlete],
		isPressed: Bool = false
	) {
		self._trail = trail
		self.athlets = athlets
		self.isPressed = isPressed
	}
}
