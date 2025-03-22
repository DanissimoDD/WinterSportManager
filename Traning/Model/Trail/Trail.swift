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
	var hasPassed: Bool
	var route: [RoutePart]

	var image: Image {
		Image("\(name)Image")
	}
	
	init(
		id: UUID = UUID(),
		name: String,
		hasPassed: Bool = false,
		route: [RoutePart]
	) {
		self.id = id
		self.name = name
		self.hasPassed = hasPassed
		self.route = route
	}
}

// MARK: - Init

extension Trail {
	init(entity: TrailEntity) {
		self.id = entity.id
		self.name = entity.name
		self.hasPassed = entity.hasPassed
		self.route = entity.route?.allObjects.compactMap { $0 as? RouteEntity }.map { RoutePart(entity: $0) } ?? []
	}
}
