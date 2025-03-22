//
//  Trail.swift
//  Traning
//
//  Created by Danil Viugov on 23.01.2025.
//

import Foundation
import SwiftUI

struct Trail: Identifiable, Hashable {
	
	let id: UUID
	let name: String
	var phase: TrailPhase
	var route: [RoutePart]

	var image: Image {
		Image("\(name)Image")
	}
	
	init(
		id: UUID = UUID(),
		name: String,
		phase: TrailPhase = .notStarted,
		route: [RoutePart]
	) {
		self.id = id
		self.name = name
		self.phase = phase
		self.route = route
	}
}

// MARK: - Init

extension Trail {
	init(entity: TrailEntity) {
		self.id = entity.id
		self.name = entity.name
		self.phase = TrailPhase(rawValue: entity.phase) ?? .inProgress
		self.route = entity.route?.allObjects.compactMap { $0 as? RouteEntity }.map { RoutePart(entity: $0) } ?? []
	}
}
